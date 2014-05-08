From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78441] [NV46] X does not start under kernel 3.13.x
Date: Thu, 08 May 2014 14:14:32 +0000
Message-ID: <bug-78441-8800-hUL5hnkq9K@http.bugs.freedesktop.org/>
References: <bug-78441-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1285735190=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78441-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1285735190==
Content-Type: multipart/alternative; boundary="1399558472.A5cee11.20085"; charset="us-ascii"


--1399558472.A5cee11.20085
Date: Thu, 8 May 2014 14:14:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78441

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #4)
> Booting with nouveau.config=NvMSI=0 didn't change things.  No idea what a
> "bisect" is.  Please advise...

git bisect. Grab a clone of the tree, and use git bisect between the good and
bad tags (v3.12 and v3.13) to identify the offending commit. You can probably
restrict the bisect to drivers/gpu/drm/nouveau.

IOW, you can run

git bisect start v3.13 v3.12 -- drivers/gpu/drm/nouveau

There are more detailed online guides that show how to use git bisect, and you
may even find something that's specific to your distro if you're not familiar
with building kernels.

Unrelated to this, your lspci shows no indication of a G86. Are you sure you
saw that on the same computer?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1399558472.A5cee11.20085
Date: Thu, 8 May 2014 14:14:32 +0000
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
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] X does not start under kernel 3.13.x"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78441">bug 78441</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=78441#c4">comment #4</a>)
<span class="quote">&gt; Booting with nouveau.config=NvMSI=0 didn't change things.  No idea what a
&gt; &quot;bisect&quot; is.  Please advise...</span >

git bisect. Grab a clone of the tree, and use git bisect between the good and
bad tags (v3.12 and v3.13) to identify the offending commit. You can probably
restrict the bisect to drivers/gpu/drm/nouveau.

IOW, you can run

git bisect start v3.13 v3.12 -- drivers/gpu/drm/nouveau

There are more detailed online guides that show how to use git bisect, and you
may even find something that's specific to your distro if you're not familiar
with building kernels.

Unrelated to this, your lspci shows no indication of a G86. Are you sure you
saw that on the same computer?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1399558472.A5cee11.20085--

--===============1285735190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1285735190==--
