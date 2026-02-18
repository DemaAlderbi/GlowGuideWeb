<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>GlowGuide - Skin Analysis Quiz</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #efe9f4, #f9f7ff);
            margin: 0;
            padding: 0;
        }

        .navbar {
            background: #6a5acd;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
        }

        .container {
            width: 65%;
            margin: auto;
            margin-top: 40px;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        h2 {
            color: #6a5acd;
            text-align: center;
            margin-bottom: 25px;
        }

        .question {
            margin-bottom: 25px;
        }

        .question p {
            font-weight: bold;
        }

        .question label {
            display: block;
            margin: 6px 0;
            cursor: pointer;
        }

        .submit-btn {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: #6a5acd;
            color: white;
            font-size: 17px;
            cursor: pointer;
            margin-top: 20px;
        }

        .submit-btn:hover {
            background: #574dcf;
        }

        .back-link {
            margin-top: 20px;
            text-align: center;
        }

        .back-link a {
            color: #6a5acd;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="navbar">GlowGuide – Smart Skin Analysis</div>

<div class="container">
    <h2>Answer All Questions for Best Results</h2>

    <form action="QuizServlet" method="post">

        <!-- 1 -->
        <div class="question">
            <p>1. How does your skin feel after washing?</p>
            <label><input type="radio" name="q1" value="dry" required> Tight & dry</label>
            <label><input type="radio" name="q1" value="normal"> Comfortable</label>
            <label><input type="radio" name="q1" value="oily"> Oily</label>
        </div>

        <!-- 2 -->
        <div class="question">
            <p>2. How shiny does your face get during the day?</p>
            <label><input type="radio" name="q2" value="dry" required> Rarely</label>
            <label><input type="radio" name="q2" value="normal"> Sometimes</label>
            <label><input type="radio" name="q2" value="oily"> Always</label>
        </div>

        <!-- 3 -->
        <div class="question">
            <p>3. Are your pores visible?</p>
            <label><input type="radio" name="q3" value="dry" required> Small</label>
            <label><input type="radio" name="q3" value="normal"> Medium</label>
            <label><input type="radio" name="q3" value="oily"> Large</label>
        </div>

        <!-- 4 -->
        <div class="question">
            <p>4. Do you get acne?</p>
            <label><input type="radio" name="q4" value="dry" required> Rarely</label>
            <label><input type="radio" name="q4" value="normal"> Sometimes</label>
            <label><input type="radio" name="q4" value="oily"> Often</label>
        </div>

        <!-- 5 -->
        <div class="question">
            <p>5. Is your skin sensitive?</p>
            <label><input type="radio" name="q5" value="normal" required> No</label>
            <label><input type="radio" name="q5" value="sensitive"> Slightly</label>
            <label><input type="radio" name="q5" value="very_sensitive"> Very</label>
        </div>

        <!-- 6 -->
        <div class="question">
            <p>6. Do skincare products cause irritation?</p>
            <label><input type="radio" name="q6" value="no" required> Never</label>
            <label><input type="radio" name="q6" value="sometimes"> Sometimes</label>
            <label><input type="radio" name="q6" value="often"> Often</label>
        </div>

        <!-- 7 -->
        <div class="question">
            <p>7. Do you live in a dry or humid area?</p>
            <label><input type="radio" name="q7" value="dry" required> Dry climate</label>
            <label><input type="radio" name="q7" value="normal"> Moderate</label>
            <label><input type="radio" name="q7" value="humid"> Humid</label>
        </div>

        <!-- 8 -->
        <div class="question">
            <p>8. How often do you wear makeup?</p>
            <label><input type="radio" name="q8" value="rarely" required> Rarely</label>
            <label><input type="radio" name="q8" value="sometimes"> Sometimes</label>
            <label><input type="radio" name="q8" value="daily"> Daily</label>
        </div>

        <!-- 9 -->
        <div class="question">
            <p>9. Does your makeup last all day?</p>
            <label><input type="radio" name="q9" value="dry" required> Cracks easily</label>
            <label><input type="radio" name="q9" value="normal"> Stays balanced</label>
            <label><input type="radio" name="q9" value="oily"> Slips off</label>
        </div>

        <!-- 10 -->
        <div class="question">
            <p>10. Do you have fine lines?</p>
            <label><input type="radio" name="q10" value="no" required> No</label>
            <label><input type="radio" name="q10" value="some"> Few</label>
            <label><input type="radio" name="q10" value="many"> Many</label>
        </div>

        <!-- 11 -->
        <div class="question">
            <p>11. Do you experience redness?</p>
            <label><input type="radio" name="q11" value="no" required> No</label>
            <label><input type="radio" name="q11" value="sometimes"> Sometimes</label>
            <label><input type="radio" name="q11" value="often"> Often</label>
        </div>

        <!-- 12 -->
        <div class="question">
            <p>12. What are your main skincare goals? (Select all that apply)</p>

            <label><input type="checkbox" name="q12[]" value="hydration"> Hydration & Moisture</label>
            <label><input type="checkbox" name="q12[]" value="oil_control"> Oil Control & Shine Reduction</label>
            <label><input type="checkbox" name="q12[]" value="acne"> Acne & Breakout Treatment</label>
            <label><input type="checkbox" name="q12[]" value="anti_aging"> Anti-aging & Wrinkles</label>
            <label><input type="checkbox" name="q12[]" value="brightening"> Brightening & Glow</label>
            <label><input type="checkbox" name="q12[]" value="dark_spots"> Dark Spots & Hyperpigmentation</label>
            <label><input type="checkbox" name="q12[]" value="redness"> Redness & Soothing</label>
            <label><input type="checkbox" name="q12[]" value="pore"> Minimize Pores</label>
            <label><input type="checkbox" name="q12[]" value="texture"> Improve Skin Texture</label>

        </div>


        <button type="submit" class="submit-btn">Get My Results</button>
    </form>

    <div class="back-link">
        <a href="home.jsp">← Back to Home</a>
    </div>

</div>

</body>
</html>
