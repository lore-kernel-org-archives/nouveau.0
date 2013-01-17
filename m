From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Thu, 17 Jan 2013 08:59:47 +0000
Message-ID: <bug-59168-8800-Na5M25g637@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1170459848=="
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


--===============1170459848==
Content-Type: multipart/alternative; boundary="1358413187.4Ace051E1.27182"; charset="us-ascii"


--1358413187.4Ace051E1.27182
Date: Thu, 17 Jan 2013 08:59:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #2 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Issue still present on 3.8.0_rc3 nouveau as of 2012-01-17 and updated drm:

S | Name                          | Type    | Version                         
| Arch  
--+-------------------------------+---------+----------------------------------+-------
i | Mesa                          | package | 9.0.1-202.7                     
| x86_64
i | kernel                        | package | 3.8.0_rc3_1_desktop_nouveau01+-7
| x86_64
i | libdrm_nouveau2               | package | 2.4.41-105.1                    
| x86_64
i | xorg-x11-driver-video-nouveau | package | 1.0.6-58.2                      
| x86_64
i | xorg-x11-server               | package | 7.6_1.13.1-218.5                
| x86_64

Somebody got an idea about this issue or some hints on what I should try?

Btw, this is with the ThinkPad running closed in the dock and external monitor
attached via DVI to DP-3. Opening the lid will not turn on the laptop panel and
will also disable the external signal to DP-3. This is another story I think,
though.

$ xrandr | grep "connect"
LVDS-1 unknown connection (normal left inverted right x axis y axis)
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 518mm x
324mm

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358413187.4Ace051E1.27182
Date: Thu, 17 Jan 2013 08:59:47 +0000
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
   title="NEW --- - [nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span></b>
        <pre>Issue still present on 3.8.0_rc3 nouveau as of 2012-01-17 and updated drm:

S | Name                          | Type    | Version                         
| Arch  
--+-------------------------------+---------+----------------------------------+-------
i | Mesa                          | package | 9.0.1-202.7                     
| x86_64
i | kernel                        | package | 3.8.0_rc3_1_desktop_nouveau01+-7
| x86_64
i | libdrm_nouveau2               | package | 2.4.41-105.1                    
| x86_64
i | xorg-x11-driver-video-nouveau | package | 1.0.6-58.2                      
| x86_64
i | xorg-x11-server               | package | 7.6_1.13.1-218.5                
| x86_64

Somebody got an idea about this issue or some hints on what I should try?

Btw, this is with the ThinkPad running closed in the dock and external monitor
attached via DVI to DP-3. Opening the lid will not turn on the laptop panel and
will also disable the external signal to DP-3. This is another story I think,
though.

$ xrandr | grep &quot;connect&quot;
LVDS-1 unknown connection (normal left inverted right x axis y axis)
VGA-1 disconnected (normal left inverted right x axis y axis)
DP-1 disconnected (normal left inverted right x axis y axis)
DP-2 disconnected (normal left inverted right x axis y axis)
DP-3 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 518mm x
324mm</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358413187.4Ace051E1.27182--

--===============1170459848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1170459848==--
