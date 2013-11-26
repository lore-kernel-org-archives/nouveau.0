From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] [NVC1] [BISECTED] Monitor on Display port
 shows distortions
Date: Tue, 26 Nov 2013 21:51:29 +0000
Message-ID: <bug-67628-8800-sOtyK8n6Ch@http.bugs.freedesktop.org/>
References: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0783252494=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67628-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0783252494==
Content-Type: multipart/alternative; boundary="1385502689.15aDFEa1.7588"; charset="us-ascii"


--1385502689.15aDFEa1.7588
Date: Tue, 26 Nov 2013 21:51:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

--- Comment #8 from Torsten Wagner <torsten.wagner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi,

sorry for the late reply. It took me some time to test it. Unfortunately,
my test a week ago from the current git did not show any improvement. Still
the same distortion on the display connected via DisplayPort.
The only think I could think of to help now would be to connect another
monitor via display port to see whether it is just a bad combination of
display manufacture and GPU/driver.
Will try to do this within the next days.

Thanks for the help and support.

Torsten


On 9 November 2013 22:01, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

>  Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed bug 67628<https://bugs.freedesktop.org/show_bug.cgi?id=67628>
>  What Removed Added  Summary [BISECTED] Monitor on Display port shows
> distortions [NVC1] [BISECTED] Monitor on Display port shows distortions
>
>  *Comment # 7 <https://bugs.freedesktop.org/show_bug.cgi?id=67628#c7> on
> bug 67628 <https://bugs.freedesktop.org/show_bug.cgi?id=67628> from Ilia
> Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> *
>
> Please try the kernel at nouveau/master
> (http://cgit.freedesktop.org/nouveau/linux-2.6/), or drm-next. This includes a
> fix for a particularly nasty bug for NVC1 specifically, which could manifest
> itself in a wide variety of ways (since 3.11), as well as a few DP-related
> fixes, e.g.http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=fa95062e052723fdeaede16af736c2bcc4cd1537
> (and a couple others).
>
>  ------------------------------
> You are receiving this mail because:
>
>    - You reported the bug.
>
>

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385502689.15aDFEa1.7588
Date: Tue, 26 Nov 2013 21:51:29 +0000
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
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
              from <span class="vcard"><a class="email" href="mailto:torsten.wagner&#64;gmail.com" title="Torsten Wagner &lt;torsten.wagner&#64;gmail.com&gt;"> <span class="fn">Torsten Wagner</span></a>
</span></b>
        <pre>Hi,

sorry for the late reply. It took me some time to test it. Unfortunately,
my test a week ago from the current git did not show any improvement. Still
the same distortion on the display connected via DisplayPort.
The only think I could think of to help now would be to connect another
monitor via display port to see whether it is just a bad combination of
display manufacture and GPU/driver.
Will try to do this within the next days.

Thanks for the help and support.

Torsten


On 9 November 2013 22:01, &lt;<a href="mailto:bugzilla-daemon&#64;freedesktop.org">bugzilla-daemon&#64;freedesktop.org</a>&gt; wrote:

<span class="quote">&gt;  Ilia Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt; changed <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="show_bug.cgi?id=67628">bug 67628</a>&lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="show_bug.cgi?id=67628">https://bugs.freedesktop.org/show_bug.cgi?id=67628</a>&gt;
&gt;  What Removed Added  Summary [BISECTED] Monitor on Display port shows
&gt; distortions [NVC1] [BISECTED] Monitor on Display port shows distortions</span >
&gt;
<span class="quote">&gt;  *<a href="show_bug.cgi?id=67628#c7">Comment # 7</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="show_bug.cgi?id=67628#c7">https://bugs.freedesktop.org/show_bug.cgi?id=67628#c7</a>&gt; on
&gt; <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="show_bug.cgi?id=67628">bug 67628</a> &lt;<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="show_bug.cgi?id=67628">https://bugs.freedesktop.org/show_bug.cgi?id=67628</a>&gt; from Ilia
&gt; Mirkin &lt;<a href="mailto:imirkin&#64;alum.mit.edu">imirkin&#64;alum.mit.edu</a>&gt; *</span >
&gt;
<span class="quote">&gt; Please try the kernel at nouveau/master
&gt; (<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/">http://cgit.freedesktop.org/nouveau/linux-2.6/</a>), or drm-next. This includes a
&gt; fix for a particularly nasty bug for NVC1 specifically, which could manifest
&gt; itself in a wide variety of ways (since 3.11), as well as a few DP-related
&gt; fixes, e.g.<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=fa95062e052723fdeaede16af736c2bcc4cd1537">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=fa95062e052723fdeaede16af736c2bcc4cd1537</a>
&gt; (and a couple others).</span >
&gt;
<span class="quote">&gt;  ------------------------------
&gt; You are receiving this mail because:</span >
&gt;
<span class="quote">&gt;    - You reported the bug.</span >
&gt;
&gt;</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385502689.15aDFEa1.7588--

--===============0783252494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0783252494==--
