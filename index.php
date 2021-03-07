<?php
require './core/flight/Flight.php';
require './core/NotORM/NotORM.php';
require './core/NotORM/PDOConf.php';

$msg = "";
$list = "";

Flight::set('flight.log_erros', false);
Flight::set('flight.handle', false);

//Rota para pagina principal
Flight::route('/', function(){
    include './views/index.html';
});

//==========================INSERT==========================//

//requisição POST para inserir os dados na tabela poço
Flight::route('POST /poco/insert' , function(){
    $db = new NotORM(PDOConfig::getInstance());
    $db->poco->insert(
        array(
            'codigo_unico'=> $_POST['codigo_unico'],
            'latitude'=> $_POST['latitude'],
            'longitude'=> $_POST['longitude']
        )
    );
   $msg = "Registro de poço realizado com sucesso!"; 
});

//requisição POST para inserir dados na tabela de casos
Flight::route('POST /casos/insert', function(){
    $db = new NotORM(PDOConfig::getInstance());
    $db->casos->insert(
        array(
            'data'=> $_POST['data'] ,
            'nome'=> $_POST['nome'],
            'codigo_zona'=> $_POST['codigo_zona']
        )
    );
    $msg = "Cadastro de caso efetuado com sucesso!";
});

//requisição POST para inserir dados na tabela de medições
Flight::route('POST /medicoes/insert' , function(){
    $db = new NotORM(PDOConfig::getInstance());
    $db->medicoes->insert(
        array(
            'data'=> $_POST['data'],
            'P_id'=> $_POST['P_id'],
            'nitrato'=> $_POST['nitrato'],
            'ph'=> $_POST['ph'],
            'cloro'=> $_POST['cloro']
        )
    );
    $msg = "Cadastro de medições realizado com sucesso!";
});

//requisição POST para inserir dados na tabela de zonas
Flight::route('POST /zona/insert', function(){
    $db = new NotORM(PDOConfig::getInstance());
    $db->zona->insert(
        array(
            'id' => $_POST['id'],
            'codigo_unico' => $_POST['codigo_unico'],
            'nome' => $_POST['nome'],   
            'area' =>$_POST[
                $db->coordenadas->insert(
                    array(
                        'latitude'=>$_POST['latitude'],
                        'longitude'=>$_POST['longitude'],
                        'codigo_unico'=>$_POST['codigo_unico']
                    )
                )
            ]        
        )
    ); 
    $msg = "O cadastro da zona foi realizado com sucesso!";
});

//==========================DELETE==========================//

//requisição GET para deletar um poço
Flight::route('GET /poco/delete/@id', function($id){
    $db = new NotORM(PDOConfig::getInstance());
    //verifica se existe um id definido
    if (isset($id)) {
        //recupera o registro da tabela poço
        $poco = $db->poco->where('id = ?', $id)->fetch();
        $medicoes = $db->medicoes->where('P_id = ?', $id)->fetch();
        //se existe algum poço com o determinado id
        if ($poco['id']) {
            //deleta o poço
            $poco->delete();
            //deleta as medições que correspondem ao poço
            $medicoes->delete();
            //retorna a mensagem
            $msg = "Poço excluido com sucesso!";
        }else{
            //se não existir poço com determinado id ele manda a mensagem
            $msg = "Poço não registrado";
        }
    }else{
        $msg = "Esse id não ";
    }
});

//requisição GET para deletar um caso
Flight::route('GET /casos/delete/@id', function($id){
    $db = new NotORM(PDOConfig::getInstance());
    //se exite um id definido
    if(isset($id)){
        //vai haver recuperação do caso que corresponde ao id
        $casos = $db->casos->where("id = ?", $id)->fetch();
        //se existir
        if ($casos['id']) {
            //será deletado
            $casos->delete();
            $msg = "Caso apagado com sucesso!";
        } else {
            //se não mostrará a mensagem
            $msg = "Caso não encontrado";
        }
    }else{
        $msg = "Caso não encontrado";
    }
});

//requisição GET para deletar um medições
Flight::route('GET /medicoes/delete/@id', function($id){
    $db = new NotORM(PDOConfig::getInstance());
    //se existir um id definido
    if(isset($id)){
        //retorna as medições do id
        $medicoes = $db->medicoes->where('id = ?', $id)->fetch();
        //se houver um registro no determinado id
        if ($medicoes['id']) {
            //deleta e retorna a mensagem
            $medicoes->delete();
            $msg = "Medições deletadas com sucesso!";
        } else {
            $msg = "Medições não registradas.";
        }
    }else{
        $msg = "Medições não encontradas";
    }
});

//requisição GET para deletar uma zona
Flight::route('GET /zona/delete/@codigo_unico', function($codigo_unico){
    $db = new NotORM(PDOConfig::getInstance());
    if(isset($codigo_unico)){
        $zona = $db->zona->where('codigo_unico = ?', $codigo_unico)->fetch();
        $coordenadas = $db->coordenadas->where('codigo_unico = ?',  $codigo_unico);
        $poco = $db->poco->where('codigo_unico = ?', $codigo_unico);
        $casos = $db->casos->where('codigo_zona = ?', $codigo_unico);
        $medicoes = $db->medicoes->where('P_id = ?', ($poco['id']));
        if ($zona['codigo_unico']) {
            $zona->delete();
            $coordenadas->delete();
            $poco->delete();
            $casos->delete();
            $medicoes->delete();
            $msg = "A zona foi deletada com sucesso!";
        } else {
            $msg = "Zona não encontrada";
        }
    }else{
        $msg = "Zona não encontrada";
    }
});

//==========================LIST JSON==========================//

//listar os medições em poços realizadas em JSON
Flight::route('/medicoes/list(/@P_id)', function($P_id){
    $db = new NotORM(PDOConfig::getInstance());
    //seleciona todos os dados de medições que correspondem ao id poço
    $data = !isset($P_id) ? $db->medicoes() : $db->medicoes->where("P_id = ?", $P_id);
    //verifica se retornou dados 
    if(count($data)){
        //cria um cabeçalho JSON
        //header('Content-Type: application/json');
        //retorna o resultado no formato JSON e adiciona a variavel list
        $list = json_encode($dados, JSON_PRETTY_PRINT);
    }
});

//listar os casos em determinada zona em JSON
Flight::route('/casos/list(/@codigo_unico)', function($codigo_unico){
    $db = new NotORM(PDOConfig::getInstance());
    //seleciona todos os dados de casos que correspondem a uma determinada zona
    $data = !isset($codigo_unico) ? $db->casos() : $db->casos->where("codigo_zona = ?", $codigo_unico);
    //verifica se retornaram dados
    if(count($data)){
        //cria um cabeçalho JSON
        //header('Content-Type: application/json');
        //retorna os resultados em formato JSON e adiciona a variavél list
        $list = json_encode($dados, JSON_PRETTY_PRINT);
    }
});

//listar as pocos em determinada zona em JSON
Flight::route('/poco/list(/@codigo_unico)', function($codigo_unico){
    $db = new NotORM(PDOConfig::getInstance());
    //seleciona todos os poços que estão localizados em uma determinada zona
    $data = !isset($codigo_unico) ? $db->poco() : $db->poco->where("codigo_unico = ?", $codigo_unico);
    //verifica se retornaram dados
    if (count($data)) {
        //constroi um cabeçalho JSON
        //header('Content_Type: application/json');
        //retorna os resultado em formato JSON e adiciona a variavel list
        $list = json_encode($dados, JSON_PRETTY_PRINT);
    }
});

//listar todas as coordenadas de uma zona
Flight::route('/coodenadas/list(/@codigo_unico)', function($codigo_unico){
    $db = new NotORM(PDOConfig::getInstance());
    //seleciona todas as coordenadas que fazem referencia a uma determinada zona
    $data = !isset($codigo_unico) ? $db->coordenadas() : $db->coordenadas->where("codigo_unico = ?", $codigo_unico);
    //verifica se algum dado foi retornado
    if(count($data)){
        //cria um cabeçalho JSON
        //header('Content_Type: application/json');
        //retorna todos os poços em JSON
        $list = json_encode($dados, JSON_PRETTY_PRINT);
    }
});

//==========================UPDATE==========================//

//atualiza dos dados do poço
Flight::route('POST /poco/update/@id', function($id){
    $db = new NotORM(PDOConfig::getInstance());
    //recebe todos os dados que correspondem ao id do poço
    $dados = !isset($id) ? $db->poco() : $db->poco->where("id = ?", $id);
    //se retornar dados
    if (count($dados)) {
        //atualiza os dados da tabela poço
        $db->poco->update(
            array(
                'codigo_unico'=> $_POST['codigo_unico'],
                'latitude'=> $_POST['latitude'],
                'longitude'=> $_POST['longitude']
            )
        );
    }
});

//atualizar dados de casos
Flight::route('POST /casos/update/@id', function($id){
    $db = new NotORM(PDOConfig::getInstance());
    //recebe todos os dados correspondentes ao id de casos
    $dados = !isset($id) ? $db->casos() : $db->casos->where("id = ?", $id);
    //se retornar dados
    if(count($dados)){
        //atualiza a tabela dados com os novos parametros que serão passados
        $db->casos->update(
            array(
                'data'=> $_POST['data'] ,
                'nome'=> $_POST['nome']
            )
        );
    }
});

//atualizar dados de medições
Flight::route('POST /medicoes/update/@id', function($id){
    $db = new NotORM(PDOConfig::getInstance());
    //recebe todos os dados na tabela de medições
    $dados = !isset($id) ? $db->medicoes() : $db->medicoes->where("id = ?", $id);
    //se retornar dados
    if(count($dados)){
        //atualiza a tabela de medições
        $db->medicoes->update(
            array(
                'data'=> $_POST['data'],
                'nitrato'=> $_POST['nitrato'],
                'ph'=> $_POST['ph'],
                'cloro'=> $_POST['cloro']
            )
        );
    }
});

//atualizar dados de zona
Flight::route('POST /zona/update/@codigo_unico', function($codigo_unico){
    $db = new NotORM(PDOConfig::getInstance());
    //recebe todos os dados na tabela de zonas
    $dados = !isset($codigo_unico) ? $db->zona() : $db->zona->where("codigo_unico = ?", $codigo_unico);
    //se retornar dados
    if(count($dados)){
        //atualiza a tabela de zonas
        $db->zona->update(
            array(
                'codigo_unico' => $_POST['codigo_unico'],
                'nome' => $_POST['nome'],  
                'area' =>$_POST[
                    $db->coordenadas->insert(
                        array(
                            'latitude'=>$_POST['latitude'],
                            'longitude'=>$_POST['longitude'],
                            'codigo_unico'=>$_POST['codigo_unico']
                        )
                    )
                ]          
            )
        );
    }
});

Flight::start();

?>
