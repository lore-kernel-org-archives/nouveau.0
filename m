From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56692] Xorg freezes with vblank enabled on nouveau
	nvc8
Date: Tue, 06 Nov 2012 14:24:49 +0000
Message-ID: <bug-56692-8800-EBsgt3eSyn@http.bugs.freedesktop.org/>
References: <bug-56692-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0501193191=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56692-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0501193191==
Content-Type: multipart/alternative; boundary="1352211889.F72b1.3759"; charset="us-ascii"


--1352211889.F72b1.3759
Date: Tue, 6 Nov 2012 14:24:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56692

--- Comment #6 from m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Wow, good catch!

My original patch for nvc0 used 0x1718 as well. I'll submit a patch for it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1352211889.F72b1.3759
Date: Tue, 6 Nov 2012 14:24:49 +0000
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
   title="NEW --- - Xorg freezes with vblank enabled on nouveau nvc8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56692#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xorg freezes with vblank enabled on nouveau nvc8"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56692">bug 56692</a>
              from <span class="vcard"><a class="email" href="mailto:m.b.lankhorst&#64;gmail.com" title="m.b.lankhorst&#64;gmail.com">m.b.lankhorst&#64;gmail.com</a>
</span></b>
        <pre>Wow, good catch!

My original patch for nvc0 used 0x1718 as well. I'll submit a patch for it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1352211889.F72b1.3759--

--===============0501193191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0501193191==--
