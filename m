From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56461] NV11 black screen & kernel hang on loading
	nouveaufb
Date: Thu, 27 Dec 2012 13:14:35 +0000
Message-ID: <bug-56461-8800-koNdxoKnOB@http.bugs.freedesktop.org/>
References: <bug-56461-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1577344734=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56461-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1577344734==
Content-Type: multipart/alternative; boundary="1356614075.cdeDa1.9854"; charset="us-ascii"


--1356614075.cdeDa1.9854
Date: Thu, 27 Dec 2012 13:14:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56461

--- Comment #36 from Chris Paulson-Ellis <chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org> ---
(In reply to comment #33)
> Does booting with nouveau.agpmode=0 and/or
> nouveau.config=DEVINIT=NvForcePost=1 change anything? (please test all 3
> combinations)

For these tests, I'm working with nouveau HEAD 73e5cf2d + dpms-fix.

Doing "modprobe nouveau" results in the fade-to-black problem as before - as do
all the following tests.

Doing "modprobe nouveau apgmode=0" removes the console messages about AGP 4x
mode and changes the GART aperture from 64 MiB to 128 MiB.

Doing "modprobe nouveau config=DEVINIT=NvForcePost=1" adds a console message
about "running init tables", changes the VRAM size from 15 MiB to 31 MiB (!)
and results in a never ending stream of PFIFO errors.

Doing "modprobe nouveau apgmode=0 config=DEVINIT=NvForcePost=1" has the
expected console changes from the 2 tests above, but with a GPU lockup error
instead of the PFIFO errors.

I'll attach console logs for the above tests.

Chris.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356614075.cdeDa1.9854
Date: Thu, 27 Dec 2012 13:14:35 +0000
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
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461#c36">Comment # 36</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NV11 black screen &amp; kernel hang on loading nouveaufb"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56461">bug 56461</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;edesix.com" title="Chris Paulson-Ellis &lt;chris&#64;edesix.com&gt;"> <span class="fn">Chris Paulson-Ellis</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=56461#c33">comment #33</a>)
<span class="quote">&gt; Does booting with nouveau.agpmode=0 and/or
&gt; nouveau.config=DEVINIT=NvForcePost=1 change anything? (please test all 3
&gt; combinations)</span >

For these tests, I'm working with nouveau HEAD 73e5cf2d + dpms-fix.

Doing &quot;modprobe nouveau&quot; results in the fade-to-black problem as before - as do
all the following tests.

Doing &quot;modprobe nouveau apgmode=0&quot; removes the console messages about AGP 4x
mode and changes the GART aperture from 64 MiB to 128 MiB.

Doing &quot;modprobe nouveau config=DEVINIT=NvForcePost=1&quot; adds a console message
about &quot;running init tables&quot;, changes the VRAM size from 15 MiB to 31 MiB (!)
and results in a never ending stream of PFIFO errors.

Doing &quot;modprobe nouveau apgmode=0 config=DEVINIT=NvForcePost=1&quot; has the
expected console changes from the 2 tests above, but with a GPU lockup error
instead of the PFIFO errors.

I'll attach console logs for the above tests.

Chris.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356614075.cdeDa1.9854--

--===============1577344734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1577344734==--
