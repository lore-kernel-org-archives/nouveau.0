From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33165] [NVA3, NVA8] gpu lockup during driver probe
Date: Sat, 18 Oct 2014 16:55:18 +0000
Message-ID: <bug-33165-8800-RACN2IhJs0@http.bugs.freedesktop.org/>
References: <bug-33165-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2058926086=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33165-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2058926086==
Content-Type: multipart/alternative; boundary="1413651318.4fb2aAE32.12472"; charset="UTF-8"


--1413651318.4fb2aAE32.12472
Date: Sat, 18 Oct 2014 16:55:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=33165

--- Comment #38 from cybjit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I applied that patch to Ubuntu Trusty 3.13.0-38.65, and it gives a huge
improvement. X no longer crashes on startup, and 3D acceleration works.

However I also get the glitchy noise a few times a second, except when showing
a static image. It is all over the screen, and sometimes appears as triangles.

Running glxgears and Firefox at the same time also starts giving errors in the
kernel log pretty quickly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413651318.4fb2aAE32.12472
Date: Sat, 18 Oct 2014 16:55:18 +0000
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
   title="NEW - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165#c38">Comment # 38</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA3, NVA8] gpu lockup during driver probe"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=33165">bug 33165</a>
              from <span class="vcard"><a class="email" href="mailto:cybjit&#64;gmail.com" title="cybjit&#64;gmail.com">cybjit&#64;gmail.com</a>
</span></b>
        <pre>I applied that patch to Ubuntu Trusty 3.13.0-38.65, and it gives a huge
improvement. X no longer crashes on startup, and 3D acceleration works.

However I also get the glitchy noise a few times a second, except when showing
a static image. It is all over the screen, and sometimes appears as triangles.

Running glxgears and Firefox at the same time also starts giving errors in the
kernel log pretty quickly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413651318.4fb2aAE32.12472--

--===============2058926086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2058926086==--
