From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79266] [NVC1] GT 430 / GF108 sluggish,
 unstable performance and blue tint with vdpau
Date: Mon, 26 May 2014 18:47:02 +0000
Message-ID: <bug-79266-8800-A0hwdw9cYT@http.bugs.freedesktop.org/>
References: <bug-79266-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0938852086=="
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


--===============0938852086==
Content-Type: multipart/alternative; boundary="1401130022.DAaBD4EA2.4567"; charset="us-ascii"


--1401130022.DAaBD4EA2.4567
Date: Mon, 26 May 2014 18:47:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79266

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Briefly adding to what Emil said (which I agree with all of):

The one-frame-at-a-time thing... is that flash only, or does it happen
elsewhere? If it's flash-only, I'm inclined to discount it as a flash bug.
Flash has _tons_ of bugs in the video functionality, they only test it directly
with the nvidia implementation, and when it works there they stop. We do not
aim to be bug-for-bug compatible with the nvidia impl.

If the one-frame-at-a-time thing happens elsewhere too, that most probably
points to an interrupt delivery problem. An easy thing to try would be to
disable MSI (boot with nouveau.config=NvMSI=0) which was added with kernel
3.13. If the issue was happening before 3.13, it's something else.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401130022.DAaBD4EA2.4567
Date: Mon, 26 May 2014 18:47:02 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] GT 430 / GF108 sluggish, unstable performance and blue tint with vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79266">bug 79266</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Briefly adding to what Emil said (which I agree with all of):

The one-frame-at-a-time thing... is that flash only, or does it happen
elsewhere? If it's flash-only, I'm inclined to discount it as a flash bug.
Flash has _tons_ of bugs in the video functionality, they only test it directly
with the nvidia implementation, and when it works there they stop. We do not
aim to be bug-for-bug compatible with the nvidia impl.

If the one-frame-at-a-time thing happens elsewhere too, that most probably
points to an interrupt delivery problem. An easy thing to try would be to
disable MSI (boot with nouveau.config=NvMSI=0) which was added with kernel
3.13. If the issue was happening before 3.13, it's something else.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401130022.DAaBD4EA2.4567--

--===============0938852086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0938852086==--
