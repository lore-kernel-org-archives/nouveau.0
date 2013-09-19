From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 49736] [NV43] piglit quick.driver tests kill X server
Date: Thu, 19 Sep 2013 10:58:05 +0000
Message-ID: <bug-49736-8800-Oa54g6u7ji@http.bugs.freedesktop.org/>
References: <bug-49736-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1004054093=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-49736-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1004054093==
Content-Type: multipart/alternative; boundary="1379588285.d7cc540E0.25470"; charset="us-ascii"


--1379588285.d7cc540E0.25470
Date: Thu, 19 Sep 2013 10:58:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=49736

--- Comment #7 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> ---
(In reply to comment #6)
> It'd be really interesting to see what the Xorg backtrace looks like with
> debug libraries (so that we can see the symbol names). BTW, does this still
> happen with fresh software (xf86-video-nouveau 1.0.9, mesa 9.2, libdrm
> 2.4.46)?

using kernel 3.12.0-rc1-00020-ga1d2bdc and mesa git master (OpenGL version
string: 2.1 Mesa 9.3.0-devel (git-e150c0d)) it still crash, but now I  think it
 just  hang GPU and  X  crashes  due  to  this ....

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379588285.d7cc540E0.25470
Date: Thu, 19 Sep 2013 10:58:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV43] piglit quick.driver tests kill X server"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49736#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV43] piglit quick.driver tests kill X server"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=49736">bug 49736</a>
              from <span class="vcard"><a class="email" href="mailto:randrik&#64;mail.ru" title="Andrew Randrianasulu &lt;randrik&#64;mail.ru&gt;"> <span class="fn">Andrew Randrianasulu</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=49736#c6">comment #6</a>)
<span class="quote">&gt; It'd be really interesting to see what the Xorg backtrace looks like with
&gt; debug libraries (so that we can see the symbol names). BTW, does this still
&gt; happen with fresh software (xf86-video-nouveau 1.0.9, mesa 9.2, libdrm
&gt; 2.4.46)?</span >

using kernel 3.12.0-rc1-00020-ga1d2bdc and mesa git master (OpenGL version
string: 2.1 Mesa 9.3.0-devel (git-e150c0d)) it still crash, but now I  think it
 just  hang GPU and  X  crashes  due  to  this ....</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379588285.d7cc540E0.25470--

--===============1004054093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1004054093==--
