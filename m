From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77361] [nve7] nouveau not working on 3.13 linux
	kernel
Date: Sun, 13 Apr 2014 10:44:28 +0000
Message-ID: <bug-77361-8800-5Tb8REZ1W1@http.bugs.freedesktop.org/>
References: <bug-77361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2059111759=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2059111759==
Content-Type: multipart/alternative; boundary="1397385868.C45a1.25563"; charset="us-ascii"


--1397385868.C45a1.25563
Date: Sun, 13 Apr 2014 10:44:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77361

--- Comment #17 from sam.halliday-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I added all the X11 drivers back in and it still failed to start up.

However, I was inspired to use the fbdev driver and it works... so at least I
have a workaround to use Debian instead of the unmaintained Ubuntu that
supports the NVIDIA drivers for this card!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397385868.C45a1.25563
Date: Sun, 13 Apr 2014 10:44:28 +0000
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
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361">bug 77361</a>
              from <span class="vcard"><a class="email" href="mailto:sam.halliday&#64;gmail.com" title="sam.halliday&#64;gmail.com">sam.halliday&#64;gmail.com</a>
</span></b>
        <pre>I added all the X11 drivers back in and it still failed to start up.

However, I was inspired to use the fbdev driver and it works... so at least I
have a workaround to use Debian instead of the unmaintained Ubuntu that
supports the NVIDIA drivers for this card!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397385868.C45a1.25563--

--===============2059111759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2059111759==--
