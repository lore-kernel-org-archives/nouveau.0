From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Thu, 12 Jun 2014 14:20:20 +0000
Message-ID: <bug-76483-8800-MjeCKpc4RW@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0795376100=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0795376100==
Content-Type: multipart/alternative; boundary="1402582820.E4c53.27847"; charset="us-ascii"


--1402582820.E4c53.27847
Date: Thu, 12 Jun 2014 14:20:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #7 from Randy Andy <gugelhuepf-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #5)
> There is a substantial DP rework bound for 3.16. Can you give
> http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next a shot? It should
> add proper support for DPMS.

Forget to mention,

my monitor is connected via DVI and I have the same problem.
Is the rework you mentioned also valid for the DVI output, so is it worth fo me
to giv it a trial?

Nevertheless thanks for your work and best regards, Andy.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402582820.E4c53.27847
Date: Thu, 12 Jun 2014 14:20:20 +0000
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
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:gugelhuepf&#64;googlemail.com" title="Randy Andy &lt;gugelhuepf&#64;googlemail.com&gt;"> <span class="fn">Randy Andy</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76483#c5">comment #5</a>)
<span class="quote">&gt; There is a substantial DP rework bound for 3.16. Can you give
&gt; <a href="http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next">http://cgit.freedesktop.org/~airlied/linux/log/?h=drm-next</a> a shot? It should
&gt; add proper support for DPMS.</span >

Forget to mention,

my monitor is connected via DVI and I have the same problem.
Is the rework you mentioned also valid for the DVI output, so is it worth fo me
to giv it a trial?

Nevertheless thanks for your work and best regards, Andy.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402582820.E4c53.27847--

--===============0795376100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0795376100==--
