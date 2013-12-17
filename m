From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Tue, 17 Dec 2013 21:17:53 +0000
Message-ID: <bug-58378-8800-jKdX0cSlEN@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1083909010=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1083909010==
Content-Type: multipart/alternative; boundary="1387315073.Aa5F5.22389"; charset="us-ascii"


--1387315073.Aa5F5.22389
Date: Tue, 17 Dec 2013 21:17:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #43 from Andreas Loew <awl1-hi6Y0CQ0nG0@public.gmane.org> ---
Hello again,

so it looks like I have now tracked the issue down.

The "offending" commit seems to be:

4c193d254ee94da02857b9670e815b1765a9579b

(the first commit which showed the issue - I tried for more than half an hour
with its direct predecessor d1b167e168bdac0b6af11e7a8c601773639fc419, but could
not reproduce the issue.


As the change by the offending commit seems really very 'simple':

  "use crypto engine for async buffer copies"

@@ -821,6 +839,7 @@ nouveau_bo_move_init(struct nouveau_channel *chan)
        } _methods[] = {
                {  "COPY", 0xa0b5, nve0_bo_move_copy, nvc0_bo_move_init },
                {  "M2MF", 0x9039, nvc0_bo_move_m2mf, nvc0_bo_move_init },
+               { "CRYPT", 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },
                {  "M2MF", 0x5039, nv50_bo_move_m2mf, nv50_bo_move_init },
                {  "M2MF", 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },

at the heart of the issue, I think we now have the question whether it indeed
is correct that there might be NV84-compatible G86 variants (such as my
8400M-based Quadro NVS130M), for which this "nv84_bo_move_exec" causes
issues...!?


One more question regarding verification with current kernels:

In a current kernel, method nouveau_bo_move_init looks similar, but different:

        } _methods[] = {
                {  "COPY", 4, 0xa0b5, nve0_bo_move_copy, nve0_bo_move_init },
                {  "GRCE", 0, 0xa0b5, nve0_bo_move_copy, nvc0_bo_move_init },
                { "COPY1", 5, 0x90b8, nvc0_bo_move_copy, nvc0_bo_move_init },
                { "COPY0", 4, 0x90b5, nvc0_bo_move_copy, nvc0_bo_move_init },
                {  "COPY", 0, 0x85b5, nva3_bo_move_copy, nv50_bo_move_init },
                { "CRYPT", 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },
                {  "M2MF", 0, 0x9039, nvc0_bo_move_m2mf, nvc0_bo_move_init },
                {  "M2MF", 0, 0x5039, nv50_bo_move_m2mf, nv50_bo_move_init },
                {  "M2MF", 0, 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },
                {},
                { "CRYPT", 0, 0x88b4, nv98_bo_move_exec, nv50_bo_move_init },
        }, *mthd = _methods;

what would be an equivalent change to a current kernel to roll back the effects
of the above forward patch?

Looking forward to your feedback...

Thanks a million & best regards,
Andreas

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387315073.Aa5F5.22389
Date: Tue, 17 Dec 2013 21:17:53 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c43">Comment # 43</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:awl1&#64;gmx.net" title="Andreas Loew &lt;awl1&#64;gmx.net&gt;"> <span class="fn">Andreas Loew</span></a>
</span></b>
        <pre>Hello again,

so it looks like I have now tracked the issue down.

The &quot;offending&quot; commit seems to be:

4c193d254ee94da02857b9670e815b1765a9579b

(the first commit which showed the issue - I tried for more than half an hour
with its direct predecessor d1b167e168bdac0b6af11e7a8c601773639fc419, but could
not reproduce the issue.


As the change by the offending commit seems really very 'simple':

  &quot;use crypto engine for async buffer copies&quot;

&#64;&#64; -821,6 +839,7 &#64;&#64; nouveau_bo_move_init(struct nouveau_channel *chan)
        } _methods[] = {
                {  &quot;COPY&quot;, 0xa0b5, nve0_bo_move_copy, nvc0_bo_move_init },
                {  &quot;M2MF&quot;, 0x9039, nvc0_bo_move_m2mf, nvc0_bo_move_init },
+               { &quot;CRYPT&quot;, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },
                {  &quot;M2MF&quot;, 0x5039, nv50_bo_move_m2mf, nv50_bo_move_init },
                {  &quot;M2MF&quot;, 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },

at the heart of the issue, I think we now have the question whether it indeed
is correct that there might be NV84-compatible G86 variants (such as my
8400M-based Quadro NVS130M), for which this &quot;nv84_bo_move_exec&quot; causes
issues...!?


One more question regarding verification with current kernels:

In a current kernel, method nouveau_bo_move_init looks similar, but different:

        } _methods[] = {
                {  &quot;COPY&quot;, 4, 0xa0b5, nve0_bo_move_copy, nve0_bo_move_init },
                {  &quot;GRCE&quot;, 0, 0xa0b5, nve0_bo_move_copy, nvc0_bo_move_init },
                { &quot;COPY1&quot;, 5, 0x90b8, nvc0_bo_move_copy, nvc0_bo_move_init },
                { &quot;COPY0&quot;, 4, 0x90b5, nvc0_bo_move_copy, nvc0_bo_move_init },
                {  &quot;COPY&quot;, 0, 0x85b5, nva3_bo_move_copy, nv50_bo_move_init },
                { &quot;CRYPT&quot;, 0, 0x74c1, nv84_bo_move_exec, nv50_bo_move_init },
                {  &quot;M2MF&quot;, 0, 0x9039, nvc0_bo_move_m2mf, nvc0_bo_move_init },
                {  &quot;M2MF&quot;, 0, 0x5039, nv50_bo_move_m2mf, nv50_bo_move_init },
                {  &quot;M2MF&quot;, 0, 0x0039, nv04_bo_move_m2mf, nv04_bo_move_init },
                {},
                { &quot;CRYPT&quot;, 0, 0x88b4, nv98_bo_move_exec, nv50_bo_move_init },
        }, *mthd = _methods;

what would be an equivalent change to a current kernel to roll back the effects
of the above forward patch?

Looking forward to your feedback...

Thanks a million &amp; best regards,
Andreas</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387315073.Aa5F5.22389--

--===============1083909010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1083909010==--
