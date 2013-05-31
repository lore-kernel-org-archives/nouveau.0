From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Fri, 31 May 2013 13:58:04 +0000
Message-ID: <bug-59168-8800-4eEaXGdu9J@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0625465427=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0625465427==
Content-Type: multipart/alternative; boundary="1370008684.BeecA3Fe4.14277"; charset="us-ascii"


--1370008684.BeecA3Fe4.14277
Date: Fri, 31 May 2013 13:58:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #35 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Might be there is good news ahead. At least for me.

Since the rebase on 3.10-rc2 some days ago (2013-05-24) I can suspend and
resume fine from within a gnome-session and gdm-login. No graphics distortion
whatsoever.

Been downgrading (a while before though) to stable X11/Mesa repo and not the
bleeding edge git versions. This shouldn't be the issue, because I was actually
switching to the git-variants in order to see their effect on the "bug" here.

Name                          | Typ   | Version                    
------------------------------+-------+----------------------------
Mesa                          | Paket | 9.1.3-240.1                
kernel                        | Paket | 3.10.0_rc2_2.24_desktop+-22
libdrm_nouveau2               | Paket | 2.4.45-110.1               
xorg-x11-driver-video-nouveau | Paket | 1.0.7-60.3                 
xorg-x11-server               | Paket | 7.6_1.14.1-234.3           


It's even frightening I can safely take the laptop (Thinkpad W520) out of the
dock (would usually freeze with high system load before) and the display
(LVDS-1) turns on automagically and on putting it back in, it switches back to
the DVI-attached LCD and the Thinkpad display goes out.

Haven't tested behaviour on taking out the laptop with closed lid and opening
afterwards, though.

Can somebody confirm their issues gone, too?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1370008684.BeecA3Fe4.14277
Date: Fri, 31 May 2013 13:58:04 +0000
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
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span></b>
        <pre>Might be there is good news ahead. At least for me.

Since the rebase on 3.10-rc2 some days ago (2013-05-24) I can suspend and
resume fine from within a gnome-session and gdm-login. No graphics distortion
whatsoever.

Been downgrading (a while before though) to stable X11/Mesa repo and not the
bleeding edge git versions. This shouldn't be the issue, because I was actually
switching to the git-variants in order to see their effect on the &quot;bug&quot; here.

Name                          | Typ   | Version                    
------------------------------+-------+----------------------------
Mesa                          | Paket | 9.1.3-240.1                
kernel                        | Paket | 3.10.0_rc2_2.24_desktop+-22
libdrm_nouveau2               | Paket | 2.4.45-110.1               
xorg-x11-driver-video-nouveau | Paket | 1.0.7-60.3                 
xorg-x11-server               | Paket | 7.6_1.14.1-234.3           


It's even frightening I can safely take the laptop (Thinkpad W520) out of the
dock (would usually freeze with high system load before) and the display
(LVDS-1) turns on automagically and on putting it back in, it switches back to
the DVI-attached LCD and the Thinkpad display goes out.

Haven't tested behaviour on taking out the laptop with closed lid and opening
afterwards, though.

Can somebody confirm their issues gone, too?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1370008684.BeecA3Fe4.14277--

--===============0625465427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0625465427==--
