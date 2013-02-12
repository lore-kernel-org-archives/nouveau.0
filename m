From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60704] [nouveau,
 git regression] - I2C PWM fan control broken on nv50 adt7475 on
 kernels 3.3.x+
Date: Tue, 12 Feb 2013 20:14:37 +0000
Message-ID: <bug-60704-8800-fCXqH7pA3a@http.bugs.freedesktop.org/>
References: <bug-60704-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1912056922=="
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


--===============1912056922==
Content-Type: multipart/alternative; boundary="1360700077.B470d2.2953"; charset="us-ascii"


--1360700077.B470d2.2953
Date: Tue, 12 Feb 2013 20:14:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60704

--- Comment #7 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 74708
  --> https://bugs.freedesktop.org/attachment.cgi?id=74708&action=edit
Use 25kbps datarate for i2c transfers

The offending commit has been almost completely reverted later on

The only differences being
* timeout (5000 > 2200)
Data is based on the VESA spec
* bitrate (12,5kbps > 50kbps)
Bitrate of 50kbps is quite reasonable, considering the standards

There are a few possible solutions
A select correct delay depending on the i2c port type
B presence of adt7475(and other) i2c sensor(s) in the extdev vbios table
C use 25kbps for all transfers
D quirk it

Patch for option C is attached

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360700077.B470d2.2953
Date: Tue, 12 Feb 2013 20:14:37 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, git regression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60704">bug 60704</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=74708" name="attach_74708" title="Use 25kbps datarate for i2c transfers">attachment 74708</a> <a href="attachment.cgi?id=74708&amp;action=edit" title="Use 25kbps datarate for i2c transfers">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=60704&amp;attachment=74708'>[review]</a>
Use 25kbps datarate for i2c transfers

The offending commit has been almost completely reverted later on

The only differences being
* timeout (5000 &gt; 2200)
Data is based on the VESA spec
* bitrate (12,5kbps &gt; 50kbps)
Bitrate of 50kbps is quite reasonable, considering the standards

There are a few possible solutions
A select correct delay depending on the i2c port type
B presence of adt7475(and other) i2c sensor(s) in the extdev vbios table
C use 25kbps for all transfers
D quirk it

Patch for option C is attached</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1360700077.B470d2.2953--

--===============1912056922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1912056922==--
