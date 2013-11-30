From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71824] [NVE6] NULL deref on boot when there is
 nothing in DCB on 3.13-rc
Date: Sat, 30 Nov 2013 09:02:09 +0000
Message-ID: <bug-71824-8800-iJopfHDxkt@http.bugs.freedesktop.org/>
References: <bug-71824-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0209961000=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71824-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0209961000==
Content-Type: multipart/alternative; boundary="1385802129.8B1B3.24886"; charset="us-ascii"


--1385802129.8B1B3.24886
Date: Sat, 30 Nov 2013 09:02:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71824

--- Comment #8 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #7)
> You can apply the equivalent of this patch to your tree (the paths are
> wrong, but it should be obvious how to fix them up):
> http://cgit.freedesktop.org/~darktama/nouveau/commit/
> ?id=2c2e48684dbe49f27e51ec0b2a4aa50df0f0f295

Or, you clone the tree, "cd drm; make && sudo make install" - and you get a
module built against your current kernel.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385802129.8B1B3.24886
Date: Sat, 30 Nov 2013 09:02:09 +0000
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
   title="NEW --- - [NVE6] NULL deref on boot when there is nothing in DCB on 3.13-rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71824#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] NULL deref on boot when there is nothing in DCB on 3.13-rc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71824">bug 71824</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=71824#c7">comment #7</a>)
<span class="quote">&gt; You can apply the equivalent of this patch to your tree (the paths are
&gt; wrong, but it should be obvious how to fix them up):
&gt; <a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/">http://cgit.freedesktop.org/~darktama/nouveau/commit/</a>
&gt; ?id=2c2e48684dbe49f27e51ec0b2a4aa50df0f0f295</span >

Or, you clone the tree, &quot;cd drm; make &amp;&amp; sudo make install&quot; - and you get a
module built against your current kernel.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385802129.8B1B3.24886--

--===============0209961000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0209961000==--
