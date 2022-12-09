<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <footer>
        <div  id="footer">  
            <p>JJHcompany : 010-1234-5678</p><br>
            <p>서울시 금천구 구디아카데미 / 이 페이지는....</p>
        </div>
    </footer>

    <script>
        const navBar = document.querySelector("nav"),
        menuBtns = document.querySelectorAll(".menu-icon"),
        overlay = document.querySelector(".overlay");
    
        menuBtns.forEach((menuBtn) => {
        menuBtn.addEventListener("click", () => {
            navBar.classList.toggle("open");
            });
            });
    
            overlay.addEventListener("click", () => {
            navBar.classList.remove("open");
        });
    </script>
</body>
</html>