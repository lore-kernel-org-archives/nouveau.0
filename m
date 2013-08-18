From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26797] [NV4C] GeForce 6150SE: DVI-connector not
	detected
Date: Sun, 18 Aug 2013 20:39:05 +0000
Message-ID: <bug-26797-8800-5GfZHCltBn@http.bugs.freedesktop.org/>
References: <bug-26797-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0890476926=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26797-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0890476926==
Content-Type: multipart/alternative; boundary="1376858345.b3228Af1.16658"; charset="us-ascii"


--1376858345.b3228Af1.16658
Date: Sun, 18 Aug 2013 20:39:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=26797

--- Comment #22 from Frank Schaefer <fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
(In reply to comment #21)
> Which kernel is the latest kernel?
3.10
I'm on Radeon hardware since then and I can't switch back easily.

> Could you put up a dmesg from it? 
Nothing has changed, DCB type 4 is still unknown.

> Also, could you supply your VBIOS? (/sys/kernel/debug/dri/0/vbios.rom)
Already sent 3 1/2 years ago. See comments #6-11


Please read the the whole bug report.
The reason why the connector doesn't work, is that the DVI connector is
realized with a Sil1364 sDVO and there is no driver for it yet.
I don't have access to datasheets of the Sil1364.
If we have a driver for this device one day, I'll be glad to test it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376858345.b3228Af1.16658
Date: Sun, 18 Aug 2013 20:39:05 +0000
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
   title="REOPENED --- - [NV4C] GeForce 6150SE: DVI-connector not detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26797#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV4C] GeForce 6150SE: DVI-connector not detected"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=26797">bug 26797</a>
              from <span class="vcard"><a class="email" href="mailto:fschaefer.oss&#64;googlemail.com" title="Frank Schaefer &lt;fschaefer.oss&#64;googlemail.com&gt;"> <span class="fn">Frank Schaefer</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=26797#c21">comment #21</a>)
<span class="quote">&gt; Which kernel is the latest kernel?</span >
3.10
I'm on Radeon hardware since then and I can't switch back easily.

<span class="quote">&gt; Could you put up a dmesg from it? </span >
Nothing has changed, DCB type 4 is still unknown.

<span class="quote">&gt; Also, could you supply your VBIOS? (/sys/kernel/debug/dri/0/vbios.rom)</span >
Already sent 3 1/2 years ago. See comments #6-11


Please read the the whole bug report.
The reason why the connector doesn't work, is that the DVI connector is
realized with a Sil1364 sDVO and there is no driver for it yet.
I don't have access to datasheets of the Sil1364.
If we have a driver for this device one day, I'll be glad to test it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376858345.b3228Af1.16658--

--===============0890476926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0890476926==--
