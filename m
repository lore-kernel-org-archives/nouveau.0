From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73373] [NVE4] GPU lockup after opening many tabs in
 Chromium web browser
Date: Wed, 08 Jan 2014 18:03:49 +0000
Message-ID: <bug-73373-8800-03x1eoXGgT@http.bugs.freedesktop.org/>
References: <bug-73373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1741995628=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73373-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1741995628==
Content-Type: multipart/alternative; boundary="1389204229.0130dA570.16081"; charset="us-ascii"


--1389204229.0130dA570.16081
Date: Wed, 8 Jan 2014 18:03:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73373

--- Comment #7 from Mario Barrera <mbarrera-KK0ffGbhmjU@public.gmane.org> ---
(In reply to comment #6)
> First, try upgrading your mesa installation to at least 10.0.1.

Hi Ilia. My version is 10.0.1, but the most precise I could specify when filing
the bug was 10.0.

> Second, you can see if the situation improves with blob graph fw. Take a
> look at http://nouveau.freedesktop.org/wiki/NVC0_Firmware/ for instructions
> on how to get the fw. (Note you only need to go up to video fw. There are
> other ways of getting the video fw should you want it.) You'll need to boot
> with nouveau.NvGrUseFW=1 in order for the fw to be loaded.

I have followed your instructions and installed the fw with the aur/nouveau-fw
package in Archlinux and added the kernel option too, but the performance seems
to not change and I could reproduce the bug, though I am not really sure if the
changes resulted in using the firmware correctly. How can I check that?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389204229.0130dA570.16081
Date: Wed, 8 Jan 2014 18:03:49 +0000
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
   title="NEW --- - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373">bug 73373</a>
              from <span class="vcard"><a class="email" href="mailto:mbarrera&#64;gmx.com" title="Mario Barrera &lt;mbarrera&#64;gmx.com&gt;"> <span class="fn">Mario Barrera</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73373#c6">comment #6</a>)
<span class="quote">&gt; First, try upgrading your mesa installation to at least 10.0.1.</span >

Hi Ilia. My version is 10.0.1, but the most precise I could specify when filing
the bug was 10.0.

<span class="quote">&gt; Second, you can see if the situation improves with blob graph fw. Take a
&gt; look at <a href="http://nouveau.freedesktop.org/wiki/NVC0_Firmware/">http://nouveau.freedesktop.org/wiki/NVC0_Firmware/</a> for instructions
&gt; on how to get the fw. (Note you only need to go up to video fw. There are
&gt; other ways of getting the video fw should you want it.) You'll need to boot
&gt; with nouveau.NvGrUseFW=1 in order for the fw to be loaded.</span >

I have followed your instructions and installed the fw with the aur/nouveau-fw
package in Archlinux and added the kernel option too, but the performance seems
to not change and I could reproduce the bug, though I am not really sure if the
changes resulted in using the firmware correctly. How can I check that?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389204229.0130dA570.16081--

--===============1741995628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1741995628==--
