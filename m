From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81485] [NVE4] dmesg spam on startup
Date: Thu, 21 Aug 2014 17:55:59 +0000
Message-ID: <bug-81485-8800-aCOMOWSo0x@http.bugs.freedesktop.org/>
References: <bug-81485-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0454645769=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81485-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0454645769==
Content-Type: multipart/alternative; boundary="1408643759.1a5c0642.28310"; charset="us-ascii"


--1408643759.1a5c0642.28310
Date: Thu, 21 Aug 2014 17:55:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81485

--- Comment #11 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Can you give this repo a shot?

http://cgit.freedesktop.org/~darktama/nouveau

It contains a few fixes for cards with "odd" memory configurations which might
help your case out. You'll have to build it against 3.17-rc1 in all likelihood.

cd drm && make

should build it against the currently-running kernel and produce a new
nouveau.ko.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408643759.1a5c0642.28310
Date: Thu, 21 Aug 2014 17:55:59 +0000
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
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] dmesg spam on startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81485">bug 81485</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Can you give this repo a shot?

<a href="http://cgit.freedesktop.org/~darktama/nouveau">http://cgit.freedesktop.org/~darktama/nouveau</a>

It contains a few fixes for cards with &quot;odd&quot; memory configurations which might
help your case out. You'll have to build it against 3.17-rc1 in all likelihood.

cd drm &amp;&amp; make

should build it against the currently-running kernel and produce a new
nouveau.ko.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408643759.1a5c0642.28310--

--===============0454645769==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0454645769==--
