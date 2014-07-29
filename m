From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80769] [NVD9] GF119M boot hang with 3.15.2
Date: Tue, 29 Jul 2014 10:37:01 +0000
Message-ID: <bug-80769-8800-Gr4DVGda0h@http.bugs.freedesktop.org/>
References: <bug-80769-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1675396710=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80769-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1675396710==
Content-Type: multipart/alternative; boundary="1406630221.4eefBD41.10467"; charset="us-ascii"


--1406630221.4eefBD41.10467
Date: Tue, 29 Jul 2014 10:37:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80769

--- Comment #6 from sven <sven.pilz+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> The xorg backtrace has intel_drv.so in it. What makes you say this is a
> nouveau bug?

The bug (DRI_PRIME=1 ...) was indeed to the Intel driver (see Bug #80001) and
is fixed in version 2.99.914.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1406630221.4eefBD41.10467
Date: Tue, 29 Jul 2014 10:37:01 +0000
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
          bz_status_NEW "
   title="NEW --- - [NVD9] GF119M boot hang with 3.15.2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80769#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVD9] GF119M boot hang with 3.15.2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80769">bug 80769</a>
              from <span class="vcard"><a class="email" href="mailto:sven.pilz+freedesktop&#64;gmail.com" title="sven &lt;sven.pilz+freedesktop&#64;gmail.com&gt;"> <span class="fn">sven</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80769#c2">comment #2</a>)
<span class="quote">&gt; The xorg backtrace has intel_drv.so in it. What makes you say this is a
&gt; nouveau bug?</span >

The bug (DRI_PRIME=1 ...) was indeed to the Intel driver (see <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - regression: X segfaults with xf86-video-intel-2.99.912 and DRI_PRIME (with radeon)"
   href="show_bug.cgi?id=80001">Bug #80001</a>) and
is fixed in version 2.99.914.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1406630221.4eefBD41.10467--

--===============1675396710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1675396710==--
