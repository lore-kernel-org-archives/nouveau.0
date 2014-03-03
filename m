From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Mon, 03 Mar 2014 02:16:07 +0000
Message-ID: <bug-59168-8800-zBq1n5Argq@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1741228232=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1741228232==
Content-Type: multipart/alternative; boundary="1393812966.7edBF6671.9089"; charset="us-ascii"


--1393812966.7edBF6671.9089
Date: Mon, 3 Mar 2014 02:16:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #43 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #42)
> Created attachment 94996 [details]
> Remove NVDEV_ENGINE_COPY1 from GF116 to mirror GF106
> 
> Since Michael Weirauch reports this issue has been resolved for his card
> (0xc3, according to his dmesg uploads), and the issue remains on Doug
> Brunner and my card (0xcf), and that both cards once used the same code-base
> and functioned correctly in the Linux 3.4 Kernels, I went on a hunch.
> 
> By changing the 0xc3 definition to 0xcf (forcing my card to be recognized as
> a GF106), I was able to reproduce Michael's suspend/resume success with my
> own card.
> 
> Having discovered that THAT works, it became a mission to figure out what
> was different between the 0xc3 (GF106, working) and 0xcf (GF116,
> non-working).
> 
> By removing the declaration of NVDEV_ENGINE_COPY1 from the 0xcf case, as
> this patch does, the suspend/resume issue no longer affects my card.
> 
> I have submitted this patch for your review, and sincerely hope it is
> accepted. Thanks!

Can you check if the issue still occurs with 3.14-rcX (but without your patch)?
Some changes were made to better respect the engine disables in register 22500.
(Speaking of which, can you grab envytools and do a "nvapeek 22500"... and also
22580)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393812966.7edBF6671.9089
Date: Mon, 3 Mar 2014 02:16:06 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c43">Comment # 43</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=59168#c42">comment #42</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=94996" name="attach_94996" title="Remove NVDEV_ENGINE_COPY1 from GF116 to mirror GF106">attachment 94996</a> <a href="attachment.cgi?id=94996&amp;action=edit" title="Remove NVDEV_ENGINE_COPY1 from GF116 to mirror GF106">[details]</a></span>
&gt; Remove NVDEV_ENGINE_COPY1 from GF116 to mirror GF106
&gt; 
&gt; Since Michael Weirauch reports this issue has been resolved for his card
&gt; (0xc3, according to his dmesg uploads), and the issue remains on Doug
&gt; Brunner and my card (0xcf), and that both cards once used the same code-base
&gt; and functioned correctly in the Linux 3.4 Kernels, I went on a hunch.
&gt; 
&gt; By changing the 0xc3 definition to 0xcf (forcing my card to be recognized as
&gt; a GF106), I was able to reproduce Michael's suspend/resume success with my
&gt; own card.
&gt; 
&gt; Having discovered that THAT works, it became a mission to figure out what
&gt; was different between the 0xc3 (GF106, working) and 0xcf (GF116,
&gt; non-working).
&gt; 
&gt; By removing the declaration of NVDEV_ENGINE_COPY1 from the 0xcf case, as
&gt; this patch does, the suspend/resume issue no longer affects my card.
&gt; 
&gt; I have submitted this patch for your review, and sincerely hope it is
&gt; accepted. Thanks!</span >

Can you check if the issue still occurs with 3.14-rcX (but without your patch)?
Some changes were made to better respect the engine disables in register 22500.
(Speaking of which, can you grab envytools and do a &quot;nvapeek 22500&quot;... and also
22580)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393812966.7edBF6671.9089--

--===============1741228232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1741228232==--
