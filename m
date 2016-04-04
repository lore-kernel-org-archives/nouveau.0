From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94643] 4K Display on Displayport goes black when
 pointer hits column 0
Date: Mon, 04 Apr 2016 13:19:41 +0000
Message-ID: <bug-94643-8800-w6M6IOi26r@http.bugs.freedesktop.org/>
References: <bug-94643-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1630315127=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94643-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1630315127==
Content-Type: multipart/alternative; boundary="14597759811.3040BDFE8.14286";
 charset="UTF-8"


--14597759811.3040BDFE8.14286
Date: Mon, 4 Apr 2016 13:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94643

--- Comment #4 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
ohhh I think in the end it is just an invalid memory access caused by some
strange offset by 1 problem and then the gpu gets a bit upset.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14597759811.3040BDFE8.14286
Date: Mon, 4 Apr 2016 13:19:41 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - 4K Display on Displayport goes black when pointer hits column 0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94643#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - 4K Display on Displayport goes black when pointer hits column 0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94643">bug 94643</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;karolherbst.de" title="Karol Herbst &lt;freedesktop&#64;karolherbst.de&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>ohhh I think in the end it is just an invalid memory access caused by some
strange offset by 1 problem and then the gpu gets a bit upset.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14597759811.3040BDFE8.14286--

--===============1630315127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1630315127==--
