    <link rel="stylesheet" href="../css/accountstyles.css"/>

    <div id="loggedincontainer">
               <label id="loggedinlabel"> Logged in as <span id="fontusername"><?php echo $_SESSION['username']; ?></span></label>
    </div>
    
    <div id="nav">
              <ul class="navelements">
                <li><a href="http://localhost/php/account.php" class="links">Account</a></li>
                <li><a href="http://localhost/php/catalog.php" class="links">Catalog</a></li>
                <li><a href="http://localhost/php/search.php" class="links">Search</a></li>
                <li><a href="http://localhost/php/quickfind.php" class="links">Quick Find</a></li>
              </ul>
    </div>