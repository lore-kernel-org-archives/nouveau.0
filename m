From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73373] [NVE4] GPU lockup after opening many tabs in
 Chromium web browser
Date: Wed, 08 Jan 2014 23:44:53 +0000
Message-ID: <bug-73373-8800-JcWaw7V1xi@http.bugs.freedesktop.org/>
References: <bug-73373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0786804578=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73373-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0786804578==
Content-Type: multipart/alternative; boundary="1389224692.b4dcAC0.11143"; charset="us-ascii"


--1389224692.b4dcAC0.11143
Date: Wed, 8 Jan 2014 23:44:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73373

--- Comment #9 from Mario Barrera <mbarrera-KK0ffGbhmjU@public.gmane.org> ---
(In reply to comment #8)
> (In reply to comment #7)
> > (In reply to comment #6)
> > > Second, you can see if the situation improves with blob graph fw. Take a
> > > look at http://nouveau.freedesktop.org/wiki/NVC0_Firmware/ for instructions
> > > on how to get the fw. (Note you only need to go up to video fw. There are
> > > other ways of getting the video fw should you want it.) You'll need to boot
> > > with nouveau.NvGrUseFW=1 in order for the fw to be loaded.
> > 
> > I have followed your instructions and installed the fw with the
> > aur/nouveau-fw package in Archlinux and added the kernel option too, but the
> 
> Pretty sure my instructions were to mmiotrace the blob by following the
> instructions on that wiki page, not to install a firmware package that only
> provides the video firmware. (And while I'm working on making my script also
> extract the graph firmware, that's not ready yet.) On the bright side, you
> should be able to use VDPAU for hw-accelerated decoding now.
> 
> Oh, I also got the cmdline option wrong -- nouveau.config=NvGrUseFW=1 --
> sorry.

I did not make the mmiotrace because I did not see any change or know if the
firmware was actually loaded.
Now I changed the option to nouveau.config=NvGrUseFW=1 and the graphics freeze
when the nouveau module loads apparently.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389224692.b4dcAC0.11143
Date: Wed, 8 Jan 2014 23:44:52 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE4] GPU lockup after opening many tabs in Chromium web browser"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73373">bug 73373</a>
              from <span class="vcard"><a class="email" href="mailto:mbarrera&#64;gmx.com" title="Mario Barrera &lt;mbarrera&#64;gmx.com&gt;"> <span class="fn">Mario Barrera</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73373#c8">comment #8</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=73373#c7">comment #7</a>)
&gt; &gt; (In reply to <a href="show_bug.cgi?id=73373#c6">comment #6</a>)
&gt; &gt; &gt; Second, you can see if the situation improves with blob graph fw. Take a
&gt; &gt; &gt; look at <a href="http://nouveau.freedesktop.org/wiki/NVC0_Firmware/">http://nouveau.freedesktop.org/wiki/NVC0_Firmware/</a> for instructions
&gt; &gt; &gt; on how to get the fw. (Note you only need to go up to video fw. There are
&gt; &gt; &gt; other ways of getting the video fw should you want it.) You'll need to boot
&gt; &gt; &gt; with nouveau.NvGrUseFW=1 in order for the fw to be loaded.
&gt; &gt; 
&gt; &gt; I have followed your instructions and installed the fw with the
&gt; &gt; aur/nouveau-fw package in Archlinux and added the kernel option too, but the
&gt; 
&gt; Pretty sure my instructions were to mmiotrace the blob by following the
&gt; instructions on that wiki page, not to install a firmware package that only
&gt; provides the video firmware. (And while I'm working on making my script also
&gt; extract the graph firmware, that's not ready yet.) On the bright side, you
&gt; should be able to use VDPAU for hw-accelerated decoding now.
&gt; 
&gt; Oh, I also got the cmdline option wrong -- nouveau.config=NvGrUseFW=1 --
&gt; sorry.</span >

I did not make the mmiotrace because I did not see any change or know if the
firmware was actually loaded.
Now I changed the option to nouveau.config=NvGrUseFW=1 and the graphics freeze
when the nouveau module loads apparently.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389224692.b4dcAC0.11143--

--===============0786804578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0786804578==--
