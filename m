From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Sun, 28 Sep 2014 09:01:03 +0000
Message-ID: <bug-27501-8800-xJMQrPM9k4@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1894690200=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1894690200==
Content-Type: multipart/alternative; boundary="1411894863.A8c7da6.11130"; charset="us-ascii"


--1411894863.A8c7da6.11130
Date: Sun, 28 Sep 2014 09:01:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #41 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Hi Thomas,

(In reply to comment #39)
> Pierre,
> 
> I have tested your patch with the 9400M in my macbookpro 5,2. The card boots
> correctly with acceleration enabled, and loads GDM. GDM looks completely
> correct, but hangs on login with a cursor on a grey screen. It's possible
> that LXDE, KDE, or some other DE might work, but gnome-shell never loads. I
> will try slim/lxde when I get a chance.

Oh... I didn't test with Gnome or KDE, as I'm using Awesome (which works fine).
Maybe if you deactivate composing it will be better (as a temporary solution)?
I'm working on improving the patch: at the moment, it turns some bits on
(enabling some features?), but the blob also writes some things (feature
configuration?) before turning each bit on. So maybe finding what those things
are and implementing them will fix the errors.
> 
> At this point I can switch back to VT where I notice some nouveau errors in
> dmesg. Killing GDM (and x11 with it) produces a kernel panic.
> 
> Next I booted with the 9600GT with acceleration disabled. The display looks
> correct with efifb, but loading nouveau scrambles the VT.

I have seen it once or twice too, but not at each boot.
On a similar note, I sometime get PDISP errors about an unknown method when
loading Nouveau, but as it rarely happen, I haven't tried to fix it yet. I'll
have a look at both errors later on.
> 
> Thank you for your efforts!

Thanks for testing! :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411894863.A8c7da6.11130
Date: Sun, 28 Sep 2014 09:01:03 +0000
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
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c41">Comment # 41</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Hi Thomas,

(In reply to <a href="show_bug.cgi?id=27501#c39">comment #39</a>)
<span class="quote">&gt; Pierre,
&gt; 
&gt; I have tested your patch with the 9400M in my macbookpro 5,2. The card boots
&gt; correctly with acceleration enabled, and loads GDM. GDM looks completely
&gt; correct, but hangs on login with a cursor on a grey screen. It's possible
&gt; that LXDE, KDE, or some other DE might work, but gnome-shell never loads. I
&gt; will try slim/lxde when I get a chance.</span >

Oh... I didn't test with Gnome or KDE, as I'm using Awesome (which works fine).
Maybe if you deactivate composing it will be better (as a temporary solution)?
I'm working on improving the patch: at the moment, it turns some bits on
(enabling some features?), but the blob also writes some things (feature
configuration?) before turning each bit on. So maybe finding what those things
are and implementing them will fix the errors.
<span class="quote">&gt; 
&gt; At this point I can switch back to VT where I notice some nouveau errors in
&gt; dmesg. Killing GDM (and x11 with it) produces a kernel panic.
&gt; 
&gt; Next I booted with the 9600GT with acceleration disabled. The display looks
&gt; correct with efifb, but loading nouveau scrambles the VT.</span >

I have seen it once or twice too, but not at each boot.
On a similar note, I sometime get PDISP errors about an unknown method when
loading Nouveau, but as it rarely happen, I haven't tried to fix it yet. I'll
have a look at both errors later on.
<span class="quote">&gt; 
&gt; Thank you for your efforts!</span >

Thanks for testing! :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411894863.A8c7da6.11130--

--===============1894690200==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1894690200==--
