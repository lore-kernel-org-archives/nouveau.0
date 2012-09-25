From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55294] Running EGL demos on DRM from mesa-demos
 causes a corrupted output on NV50
Date: Tue, 25 Sep 2012 20:50:15 +0000
Message-ID: <bug-55294-8800-2sutfppiEJ@http.bugs.freedesktop.org/>
References: <bug-55294-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1886377440=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55294-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1886377440==
Content-Type: multipart/alternative; boundary="1348606215.a65E06c1.18176"; charset="us-ascii"


--1348606215.a65E06c1.18176
Date: Tue, 25 Sep 2012 20:50:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55294

--- Comment #2 from Lubosz Sarnecki <lubosz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
joi on the irc figured out that it has to do with the resolution I am trying to
set (1366 x 768).

With his patch on the demos http://bpaste.net/show/47560/ I was able to set a
1280 x 768 resolution successfully.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1348606215.a65E06c1.18176
Date: Tue, 25 Sep 2012 20:50:15 +0000
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
   title="NEW --- - Running EGL demos on DRM from mesa-demos causes a corrupted output on NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55294#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Running EGL demos on DRM from mesa-demos causes a corrupted output on NV50"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55294">bug 55294</a>
              from <span class="vcard"><a class="email" href="mailto:lubosz&#64;gmail.com" title="Lubosz Sarnecki &lt;lubosz&#64;gmail.com&gt;"> <span class="fn">Lubosz Sarnecki</span></a>
</span></b>
        <pre>joi on the irc figured out that it has to do with the resolution I am trying to
set (1366 x 768).

With his patch on the demos <a href="http://bpaste.net/show/47560/">http://bpaste.net/show/47560/</a> I was able to set a
1280 x 768 resolution successfully.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1348606215.a65E06c1.18176--

--===============1886377440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1886377440==--
