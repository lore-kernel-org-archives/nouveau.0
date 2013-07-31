From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Wed, 31 Jul 2013 16:58:57 +0000
Message-ID: <bug-67315-8800-hp7NDNDShz@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1933468768=="
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


--===============1933468768==
Content-Type: multipart/alternative; boundary="1375289937.fA061.16429"; charset="us-ascii"


--1375289937.fA061.16429
Date: Wed, 31 Jul 2013 16:58:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #21 from Rick Stevens <ricks-ijgZXeOBpMSRq8AjE7tl8g@public.gmane.org> ---
Created attachment 83383
  --> https://bugs.freedesktop.org/attachment.cgi?id=83383&action=edit
mmio trace along with dmesg and Xorg logs

I did as you asked...rebooted in run level 3 with plymouth disabled. Started
the mmio trace, then started X by using "telinit 5", tried to bring up the
screen saver stuff, waited for it to lock up, waited until it restarted, then
stopped the mmio trace and grabbed dmesg and the last two Xorg log files.

I hope that gives you more insight. I await your feedback.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375289937.fA061.16429
Date: Wed, 31 Jul 2013 16:58:57 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:ricks&#64;alldigital.com" title="Rick Stevens &lt;ricks&#64;alldigital.com&gt;"> <span class="fn">Rick Stevens</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=83383" name="attach_83383" title="mmio trace along with dmesg and Xorg logs">attachment 83383</a> <a href="attachment.cgi?id=83383&amp;action=edit" title="mmio trace along with dmesg and Xorg logs">[details]</a></span>
mmio trace along with dmesg and Xorg logs

I did as you asked...rebooted in run level 3 with plymouth disabled. Started
the mmio trace, then started X by using &quot;telinit 5&quot;, tried to bring up the
screen saver stuff, waited for it to lock up, waited until it restarted, then
stopped the mmio trace and grabbed dmesg and the last two Xorg log files.

I hope that gives you more insight. I await your feedback.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375289937.fA061.16429--

--===============1933468768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1933468768==--
