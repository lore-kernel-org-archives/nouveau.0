From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85471] nouveau/kernel 3.18.0-rc1: nouveau deadlocks
 on 2nd Xorg start or reboot
Date: Sun, 26 Oct 2014 09:39:14 +0000
Message-ID: <bug-85471-8800-LPeLmnmipn@http.bugs.freedesktop.org/>
References: <bug-85471-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1661281310=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85471-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1661281310==
Content-Type: multipart/alternative; boundary="1414316354.8D15e1.1249"; charset="UTF-8"


--1414316354.8D15e1.1249
Date: Sun, 26 Oct 2014 09:39:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85471

--- Comment #1 from Christian Vogel <vogelchr-InfKab39H3A@public.gmane.org> ---
Created attachment 108439
  --> https://bugs.freedesktop.org/attachment.cgi?id=108439&action=edit
/var/log/Xorg.0.log on normal X-server start up to termination

Starting and stopping the X-server the first time looks unremarkable.

[    34.778] resize called 2944 1280                                            

   -> here display manager appears
   -> I then stop lightdm to terminate X-server

[    77.620] (II) evdev: Logitech USB-PS/2 Optical Mouse: Close

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414316354.8D15e1.1249
Date: Sun, 26 Oct 2014 09:39:14 +0000
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
   title="NEW - nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85471#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85471">bug 85471</a>
              from <span class="vcard"><a class="email" href="mailto:vogelchr&#64;vogel.cx" title="Christian Vogel &lt;vogelchr&#64;vogel.cx&gt;"> <span class="fn">Christian Vogel</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=108439" name="attach_108439" title="/var/log/Xorg.0.log on normal X-server start up to termination">attachment 108439</a> <a href="attachment.cgi?id=108439&amp;action=edit" title="/var/log/Xorg.0.log on normal X-server start up to termination">[details]</a></span>
/var/log/Xorg.0.log on normal X-server start up to termination

Starting and stopping the X-server the first time looks unremarkable.

[    34.778] resize called 2944 1280                                            

   -&gt; here display manager appears
   -&gt; I then stop lightdm to terminate X-server

[    77.620] (II) evdev: Logitech USB-PS/2 Optical Mouse: Close</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414316354.8D15e1.1249--

--===============1661281310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1661281310==--
