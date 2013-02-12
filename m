From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60704] [nouveau,
 git regression] - I2C PWM fan control broken on nv50 adt7475 on
 kernels 3.3.x+
Date: Tue, 12 Feb 2013 01:52:27 +0000
Message-ID: <bug-60704-8800-EJpzoiwf10@http.bugs.freedesktop.org/>
References: <bug-60704-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0107412652=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60704-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0107412652==
Content-Type: multipart/alternative; boundary="1360633947.7d1BaC31.30792"; charset="us-ascii"


--1360633947.7d1BaC31.30792
Date: Tue, 12 Feb 2013 01:52:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60704

--- Comment #4 from Marc Meledandri <m.meledandri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 74661
  --> https://bugs.freedesktop.org/attachment.cgi?id=74661&action=edit
git-master-NAK-Bailout-dmesg.log

With kernels 3.4.29, 3.7.3 and the nouveau git master observing:

i2c i2c-4: sendbytes: NAK bailout.

messages in syslog.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360633947.7d1BaC31.30792
Date: Tue, 12 Feb 2013 01:52:27 +0000
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
   title="NEW --- - [nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704">bug 60704</a>
              from <span class="vcard"><a class="email" href="mailto:m.meledandri&#64;gmail.com" title="Marc Meledandri &lt;m.meledandri&#64;gmail.com&gt;"> <span class="fn">Marc Meledandri</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=74661" name="attach_74661" title="git-master-NAK-Bailout-dmesg.log">attachment 74661</a> <a href="attachment.cgi?id=74661&amp;action=edit" title="git-master-NAK-Bailout-dmesg.log">[details]</a></span>
git-master-NAK-Bailout-dmesg.log

With kernels 3.4.29, 3.7.3 and the nouveau git master observing:

i2c i2c-4: sendbytes: NAK bailout.

messages in syslog.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360633947.7d1BaC31.30792--

--===============0107412652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0107412652==--
