<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title">Acesso restrito</h5>
                </div>
                <div class="panel-body">
                    <form action='<?php echo $url->make('login/login'); ?>' method='post'
                          name='process'>
                        <input type="hidden" name="method" id="method" value="login"/>
                        <label for='username'> Login </label>
                        <input class="form-control" type='text' name='username' id='username' size='25'/>
                        <label for='password'> Senha </label>
                        <input class="form-control" type='password' name='password' id='password' size='25'/>
                        <br/>
                        <input type='Submit' value='Login' class="btn btn-block btn-default"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>