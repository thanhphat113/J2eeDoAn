<%-- 
    Document   : login
    Created on : 6 thg 12, 2023, 21:20:39
    Author     : lythanhphat9523
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="css/tailwind.css" />

        <!-- Thêm một dòng này vào phần head của mỗi trang. -->
        <script src="https://cdn.tailwindcss.com"></script>

        <title>Login</title>
    </head>
    <body>
        <div class="h-[100vh] flex bg-gray-200 w-full flex-col md:flex-row">
            <div class="md:w-3/5 flex items-center justify-center">
                <div class="character waving">
                    <img
                        src="data:image/png;base64,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"
                        alt="Character"
                        class="md:max-w-lg max-w-[170px]"
                        />
                </div>
            </div>

            <div class="md:w-2/5 flex items-center justify-center">
                <div
                    class="max-w-md w-full p-6 space-y-8 bg-white rounded-lg shadow-md shadow-blue-200"
                    >
                    <form class="space-y-6">
                        <div class="flex items-center justify-center bg-gray-50">
                            <div class="max-w-md w-full p-6 bg-white rounded-lg shadow-lg">
                                <div>
                                    <h2
                                        class="mt-6 text-2xl md:text-3xl font-extrabold text-gray-900"
                                        >
                                        Đăng nhập vào tài khoản của bạn
                                    </h2>
                                </div>
                                <form class="mt-8 space-y-6" action="LoginController" method="post">
                                    <div>
                                        <label
                                            htmlFor="Username"
                                            class="block text-sm font-medium text-gray-700"
                                            >
                                            Tên tài khoản
                                        </label>
                                        <div class="mt-1">
                                            <input
                                                id="Username"
                                                required
                                                class="py-2 px-3 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                                />
                                        </div>
                                    </div>
                                    <div>
                                        <label
                                            htmlFor="password"
                                            class="block text-sm font-medium text-gray-700"
                                            >
                                            Mật khẩu
                                        </label>
                                        <div class="mt-1">
                                            <input
                                                id="password"
                                                name="password"
                                                type="password"
                                                autocomplete="current-password"
                                                required
                                                class="py-2 px-3 block w-full border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                                />
                                        </div>
                                    </div>
                                    <div>
                                        <button 
                                            type="submit"
                                            class="mt-2 group relative w-full flex justify-center py-2 mb-3 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                                            >
                                            Đăng nhập
                                        </button>
                                    </div>
                                    <span class="text-gray-500 font-semibold text-sm">
                                        Chưa có tài khoản?
                                    </span>

                                    <a href="signup.jsp">
                                        <span
                                            class="text-blue-600 underline font-semibold text-sm cursor-pointer ml-1 dark:text-blue-400 dark:hover:text-blue-600"
                                            >
                                            Đăng ký
                                        </span>
                                    </a>
                                </form>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
