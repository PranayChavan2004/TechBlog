<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">
      <span class="fa fa-mortar-board">&nbsp;</span> TechBlog
    </a>
    <!-- click on TechBlog to visit index page -->

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">
            <span class="fas fa-file-alt">&nbsp;</span>LearnCoding
          </a>
        </li>

        <!-- Dropdown -->
<li class="nav-item dropdown">
  <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" 
     role="button" data-bs-toggle="dropdown" aria-expanded="false">
    Categories
  </a>
  <ul class="dropdown-menu primary-background" aria-labelledby="navbarDropdown">
    <li><a class="dropdown-item" href="#">Programming Languages</a></li> 
    <li><a class="dropdown-item" href="#">Project Implementation</a></li>
    <li><hr class="dropdown-divider bg-light"></li>
    <li><a class="dropdown-item" href="#">Data Structure</a></li>
  </ul>
</li>


        <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
        <li class="nav-item"><a class="nav-link" href="login_page.jsp">Login</a></li>
        <li class="nav-item"><a class="nav-link" href="registration_page.jsp">Sign up</a></li>
      </ul>

      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-light" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
