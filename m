From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Wed, 11 Jun 2014 17:21:09 +0000
Message-ID: <bug-79823-8800-nDbdpmhJDj@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1587922299=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1587922299==
Content-Type: multipart/alternative; boundary="1402507269.d4Ae1.9838"; charset="us-ascii"


--1402507269.d4Ae1.9838
Date: Wed, 11 Jun 2014 17:21:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #12)
> (In reply to comment #11)
> > Hm, that's funny. You said 10.1.4 worked, which contains that commit... I
> > suspected that commit as well until I saw that you said 10.1.4 was fine.
> > I'll think about it.
> 
> I said 10.1.4 WAS fine, already builded (21.06.2014) and downloaded from
> Arch Linux repository.

Yes, that was my implication as well.

> But in current building environment, all revisions since bisected commit
> seems buggy on nv30.
> 
> I will try to revert this patch on tomorrow.

There's probably some additional interaction with a patch that hadn't made it
to 10.1... perhaps the screen sharing change to better support
NV_vdpau_interop, but I don't really see how that could cause issues either.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402507269.d4Ae1.9838
Date: Wed, 11 Jun 2014 17:21:09 +0000
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
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=79823#c12">comment #12</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=79823#c11">comment #11</a>)
&gt; &gt; Hm, that's funny. You said 10.1.4 worked, which contains that commit... I
&gt; &gt; suspected that commit as well until I saw that you said 10.1.4 was fine.
&gt; &gt; I'll think about it.
&gt; 
&gt; I said 10.1.4 WAS fine, already builded (21.06.2014) and downloaded from
&gt; Arch Linux repository.</span >

Yes, that was my implication as well.

<span class="quote">&gt; But in current building environment, all revisions since bisected commit
&gt; seems buggy on nv30.
&gt; 
&gt; I will try to revert this patch on tomorrow.</span >

There's probably some additional interaction with a patch that hadn't made it
to 10.1... perhaps the screen sharing change to better support
NV_vdpau_interop, but I don't really see how that could cause issues either.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402507269.d4Ae1.9838--

--===============1587922299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1587922299==--
