From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61287] (bisected) kernel>=3.7 breaks nouveau with
 acceleration for GeForce 6150SE nForce 430
Date: Mon, 25 Feb 2013 08:53:06 +0000
Message-ID: <bug-61287-8800-LyNvxH8pj0@http.bugs.freedesktop.org/>
References: <bug-61287-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1312811731=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61287-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1312811731==
Content-Type: multipart/alternative; boundary="1361782386.FbEFA3ec1.21693"; charset="us-ascii"


--1361782386.FbEFA3ec1.21693
Date: Mon, 25 Feb 2013 08:53:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61287

--- Comment #5 from gabriele balducci <balducci-KqplAB4qOuE@public.gmane.org> ---
Following comment #8 in
https://bugs.freedesktop.org/show_bug.cgi?id=61321 (which deals
with the same GPU), the problems go away if I boot 3.7.9 with
nouveau.noaccel=1.

Of course, this means that glxgears and vmd run without crashing
the X11 session, *BUT* without acceleration. In particular, vmd without
acceleration is unacceptably slow for me, so running without
acceleration is not an option...

However, this reinforces the idea that the problem is definitely
related to acceleration.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361782386.FbEFA3ec1.21693
Date: Mon, 25 Feb 2013 08:53:06 +0000
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
   title="NEW --- - (bisected) kernel&gt;=3.7 breaks nouveau with acceleration for GeForce 6150SE nForce 430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61287#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - (bisected) kernel&gt;=3.7 breaks nouveau with acceleration for GeForce 6150SE nForce 430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61287">bug 61287</a>
              from <span class="vcard"><a class="email" href="mailto:balducci&#64;units.it" title="gabriele balducci &lt;balducci&#64;units.it&gt;"> <span class="fn">gabriele balducci</span></a>
</span></b>
        <pre>Following <a href="show_bug.cgi?id=61287#c8">comment #8</a> in
<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression][NV4c] System hang while loading gdm on 3.7 kernel (works on 3.6)"
   href="show_bug.cgi?id=61321">https://bugs.freedesktop.org/show_bug.cgi?id=61321</a> (which deals
with the same GPU), the problems go away if I boot 3.7.9 with
nouveau.noaccel=1.

Of course, this means that glxgears and vmd run without crashing
the X11 session, *BUT* without acceleration. In particular, vmd without
acceleration is unacceptably slow for me, so running without
acceleration is not an option...

However, this reinforces the idea that the problem is definitely
related to acceleration.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361782386.FbEFA3ec1.21693--

--===============1312811731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1312811731==--
