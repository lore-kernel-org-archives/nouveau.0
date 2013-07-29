From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Mon, 29 Jul 2013 20:30:49 +0000
Message-ID: <bug-67315-8800-iMwKp2sIwh@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0371336614=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0371336614==
Content-Type: multipart/alternative; boundary="1375129849.E73eC1.10769"; charset="us-ascii"


--1375129849.E73eC1.10769
Date: Mon, 29 Jul 2013 20:30:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #11 from Rick Stevens <ricks-ijgZXeOBpMSRq8AjE7tl8g@public.gmane.org> ---
(In reply to comment #9)
> (In reply to comment #8)
> > I'm ready to continue sorting this out. Enjoyed adequate sleep over the
> > weekend so I'm rarin' to go.
> > 
> > What else do you need from me?
> 
> Answers to the last two questions would be nice as a start :P

In answer to your first question (I think), yes, those captures were from the
same boot/crash cycle, acquired as I mentioned in my comments.

In answer to the second, I'm not sure how to correlate the timestamps. Looking
at the dmesg output, the first "nouveau E" message occurred 19 seconds into the
boot process. This is long before the login screen for the desktop appears.

The next messages seem to occur once I log in via the desktop login screen,
about 55 seconds after the boot. The screensaver shouldn't start for at least
10 minutes after that. As I said, if I try to do something such as adjust the
screen saver parameters via XFCE's "Applications Menu->Settings->Screensaver"
menu, as soon as the frame containing the the applications window is rendered
the display, keyboard and mouse lock up.

> 
> (In reply to comment #6)
> > In the last attachment Xorg.log claims that it's starts at ~81.456, whereas
> > dmesg states that X was running ~19.627541.
> > * Are those logs matching (ie. captured from the same boot/system startup)
> > I'm assuming that you've started your screensaver ~55.041877. Is that
> > correct ?
> I.e. understanding the timeline would be beneficial
> 
> > * Do you recall when did your nouveau started started reporting errors
> > (nouveau E) ?
> > 
> I'm talking about nouveau errors in general, indicated by "nouveau E"
> disregarding the I've mentioned as harmless. If unsure attach dmesg of older
> kernels that you have handy :)

dmesg is wiped each time I boot the machine. I guess I could try to set up
something that would log it to a disk file instead of just in the ring buffer.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375129849.E73eC1.10769
Date: Mon, 29 Jul 2013 20:30:49 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:ricks&#64;alldigital.com" title="Rick Stevens &lt;ricks&#64;alldigital.com&gt;"> <span class="fn">Rick Stevens</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67315#c9">comment #9</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=67315#c8">comment #8</a>)
&gt; &gt; I'm ready to continue sorting this out. Enjoyed adequate sleep over the
&gt; &gt; weekend so I'm rarin' to go.
&gt; &gt; 
&gt; &gt; What else do you need from me?
&gt; 
&gt; Answers to the last two questions would be nice as a start :P</span >

In answer to your first question (I think), yes, those captures were from the
same boot/crash cycle, acquired as I mentioned in my comments.

In answer to the second, I'm not sure how to correlate the timestamps. Looking
at the dmesg output, the first &quot;nouveau E&quot; message occurred 19 seconds into the
boot process. This is long before the login screen for the desktop appears.

The next messages seem to occur once I log in via the desktop login screen,
about 55 seconds after the boot. The screensaver shouldn't start for at least
10 minutes after that. As I said, if I try to do something such as adjust the
screen saver parameters via XFCE's &quot;Applications Menu-&gt;Settings-&gt;Screensaver&quot;
menu, as soon as the frame containing the the applications window is rendered
the display, keyboard and mouse lock up.

<span class="quote">&gt; 
&gt; (In reply to <a href="show_bug.cgi?id=67315#c6">comment #6</a>)
&gt; &gt; In the last attachment Xorg.log claims that it's starts at ~81.456, whereas
&gt; &gt; dmesg states that X was running ~19.627541.
&gt; &gt; * Are those logs matching (ie. captured from the same boot/system startup)
&gt; &gt; I'm assuming that you've started your screensaver ~55.041877. Is that
&gt; &gt; correct ?
&gt; I.e. understanding the timeline would be beneficial
&gt; 
&gt; &gt; * Do you recall when did your nouveau started started reporting errors
&gt; &gt; (nouveau E) ?
&gt; &gt; 
&gt; I'm talking about nouveau errors in general, indicated by &quot;nouveau E&quot;
&gt; disregarding the I've mentioned as harmless. If unsure attach dmesg of older
&gt; kernels that you have handy :)</span >

dmesg is wiped each time I boot the machine. I guess I could try to set up
something that would log it to a disk file instead of just in the ring buffer.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375129849.E73eC1.10769--

--===============0371336614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0371336614==--
