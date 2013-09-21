From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66255] Xinerama 2x2 monitor configuration display
	issues
Date: Sat, 21 Sep 2013 18:05:36 +0000
Message-ID: <bug-66255-8800-WmGwDKteMP@http.bugs.freedesktop.org/>
References: <bug-66255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1449008928=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1449008928==
Content-Type: multipart/alternative; boundary="1379786736.B0bbc2.24925"; charset="us-ascii"


--1379786736.B0bbc2.24925
Date: Sat, 21 Sep 2013 18:05:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66255

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/

You only have 2 screens in your config, you need 4 screens for Xinerama to work
properly (one per monitor). Otherwise it makes sense that you get the scrolling
behaviour. Have you tried this with nouveau 1.0.9?

An alternative if you have xorg 1.14.3, is to use reverse prime. This is a bit
experimental and will likely be rather slow. (Basically using GPU0 to do all
the rendering and transfer the textures to GPU1 for actual display.) To do
that, take a look at http://nouveau.freedesktop.org/wiki/Optimus/ (it's
describing a different case, but some of the ideas carry over).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379786736.B0bbc2.24925
Date: Sat, 21 Sep 2013 18:05:36 +0000
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
   title="NEW --- - Xinerama 2x2 monitor configuration display issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xinerama 2x2 monitor configuration display issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre><a href="http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/">http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/</a>

You only have 2 screens in your config, you need 4 screens for Xinerama to work
properly (one per monitor). Otherwise it makes sense that you get the scrolling
behaviour. Have you tried this with nouveau 1.0.9?

An alternative if you have xorg 1.14.3, is to use reverse prime. This is a bit
experimental and will likely be rather slow. (Basically using GPU0 to do all
the rendering and transfer the textures to GPU1 for actual display.) To do
that, take a look at <a href="http://nouveau.freedesktop.org/wiki/Optimus/">http://nouveau.freedesktop.org/wiki/Optimus/</a> (it's
describing a different case, but some of the ideas carry over).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379786736.B0bbc2.24925--

--===============1449008928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1449008928==--
