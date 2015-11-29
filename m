From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Sun, 29 Nov 2015 07:00:48 +0000
Message-ID: <bug-92077-8800-KWE1pBzQSo@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0868753887=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0868753887==
Content-Type: multipart/alternative; boundary="1448780448.3df2fd0.9425"; charset="UTF-8"


--1448780448.3df2fd0.9425
Date: Sun, 29 Nov 2015 07:00:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92077

--- Comment #14 from zoominee <gentoo-5cK0ikVjkE4@public.gmane.org> ---
Regarding the kernel patch - I first wanted to see if the mesa update from
Comment 10 fixed this issue. (I suppose it did not.)

I then applied the patch from the Comment 11 (manually to 4.1.12). The problem
still persists.  The apitrace replays, then freezes somewhere (not at the same
place as before).  The mouse pointer still works, but I can't do anything and
nothing else on the screen is updated, I can't even change to console.

Do I maybe have to generate a new apitrace (i.e., the problem is stored in the
apitrace file created using the old versions)?  Or maybe this is a different
problem from the one addressed in the patch?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1448780448.3df2fd0.9425
Date: Sun, 29 Nov 2015 07:00:48 +0000
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
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engine fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92077">bug 92077</a>
              from <span class="vcard"><a class="email" href="mailto:gentoo&#64;moin.fi" title="zoominee &lt;gentoo&#64;moin.fi&gt;"> <span class="fn">zoominee</span></a>
</span></b>
        <pre>Regarding the kernel patch - I first wanted to see if the mesa update from
<a href="show_bug.cgi?id=92077#c10">Comment 10</a> fixed this issue. (I suppose it did not.)

I then applied the patch from the <a href="show_bug.cgi?id=92077#c11">Comment 11</a> (manually to 4.1.12). The problem
still persists.  The apitrace replays, then freezes somewhere (not at the same
place as before).  The mouse pointer still works, but I can't do anything and
nothing else on the screen is updated, I can't even change to console.

Do I maybe have to generate a new apitrace (i.e., the problem is stored in the
apitrace file created using the old versions)?  Or maybe this is a different
problem from the one addressed in the patch?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448780448.3df2fd0.9425--

--===============0868753887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0868753887==--
