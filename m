From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] [NVC1] GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 20:40:37 +0000
Message-ID: <bug-79266-8800-I5tGQP4awj@http.bugs.freedesktop.org/>
References: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0434842023=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79266-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0434842023==
Content-Type: multipart/alternative; boundary="1401136836.c58cDBE1.24041"; charset="us-ascii"


--1401136836.c58cDBE1.24041
Date: Mon, 26 May 2014 20:40:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

--- Comment #16 from C0NPAQ <afasdfsdfaa-NltIWcMOmWn1P9xLtpHBDw@public.gmane.org> ---
(In reply to comment #9)
> Briefly adding to what Emil said (which I agree with all of):
> 
> The one-frame-at-a-time thing... is that flash only, or does it happen
> elsewhere? If it's flash-only, I'm inclined to discount it as a flash bug.
> Flash has _tons_ of bugs in the video functionality, they only test it
> directly with the nvidia implementation, and when it works there they stop.
> We do not aim to be bug-for-bug compatible with the nvidia impl.
> 
> If the one-frame-at-a-time thing happens elsewhere too, that most probably
> points to an interrupt delivery problem. An easy thing to try would be to
> disable MSI (boot with nouveau.config=NvMSI=0) which was added with kernel
> 3.13. If the issue was happening before 3.13, it's something else.


What do you mean by "one-frame-at-a-time"? And -no-, although most of the
issues seem to be 'intensified' by using flash player they occur regardless if
it is used or not. Seemingly the correlating factor is merely processor and
memory utilization combined with sheer randomness, which would conform to my
memory-leak-somewhere theory. MSI might be a possiblity, but I won't test again
anywhen soon. I almost cried half an hour ago it was so terrible.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401136836.c58cDBE1.24041
Date: Mon, 26 May 2014 20:40:36 +0000
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
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
              from <span class="vcard"><a class="email" href="mailto:afasdfsdfaa&#64;master.ms" title="C0NPAQ &lt;afasdfsdfaa&#64;master.ms&gt;"> <span class="fn">C0NPAQ</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=79266#c9">comment #9</a>)
<span class="quote">&gt; Briefly adding to what Emil said (which I agree with all of):
&gt; 
&gt; The one-frame-at-a-time thing... is that flash only, or does it happen
&gt; elsewhere? If it's flash-only, I'm inclined to discount it as a flash bug.
&gt; Flash has _tons_ of bugs in the video functionality, they only test it
&gt; directly with the nvidia implementation, and when it works there they stop.
&gt; We do not aim to be bug-for-bug compatible with the nvidia impl.
&gt; 
&gt; If the one-frame-at-a-time thing happens elsewhere too, that most probably
&gt; points to an interrupt delivery problem. An easy thing to try would be to
&gt; disable MSI (boot with nouveau.config=NvMSI=0) which was added with kernel
&gt; 3.13. If the issue was happening before 3.13, it's something else.</span >


What do you mean by &quot;one-frame-at-a-time&quot;? And -no-, although most of the
issues seem to be 'intensified' by using flash player they occur regardless if
it is used or not. Seemingly the correlating factor is merely processor and
memory utilization combined with sheer randomness, which would conform to my
memory-leak-somewhere theory. MSI might be a possiblity, but I won't test again
anywhen soon. I almost cried half an hour ago it was so terrible.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401136836.c58cDBE1.24041--

--===============0434842023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0434842023==--
