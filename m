From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Wed, 03 Apr 2013 07:02:23 +0000
Message-ID: <bug-59168-8800-IGq1IIdUyz@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1919909452=="
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


--===============1919909452==
Content-Type: multipart/alternative; boundary="1364972543.EA77F63.17665"; charset="us-ascii"


--1364972543.EA77F63.17665
Date: Wed, 3 Apr 2013 07:02:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #33 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Still present on nouveau 3.9.0-rc4 (master@git) as of 2013-04-03.

Name                          | Type    | Version                         
------------------------------+---------+---------------------------------
Mesa                          | package | 9.1.1-247.1                     
kernel                        | package | 3.9.0_rc4_1_desktop_nouveau01+-3
libdrm_nouveau2               | package | 2.4.43-118.1                    
xorg-x11-driver-video-nouveau | package | 1.0.7@git-2013-04-03
xorg-x11-server               | package | 7.6_1.14.0-243.8         

@Marcin Slusarz, if you are reading this:

Do you think it's worthwhile trying your script limiter patch from bug 23223
comment 18 mentioned by Ronald in conjunction with
"nouveau.config=DEVINIT=NvForcePost=1"?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1364972543.EA77F63.17665
Date: Wed, 3 Apr 2013 07:02:23 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:michael.weirauch&#64;gmail.com" title="michael.weirauch&#64;gmail.com">michael.weirauch&#64;gmail.com</a>
</span></b>
        <pre>Still present on nouveau 3.9.0-rc4 (master&#64;git) as of 2013-04-03.

Name                          | Type    | Version                         
------------------------------+---------+---------------------------------
Mesa                          | package | 9.1.1-247.1                     
kernel                        | package | 3.9.0_rc4_1_desktop_nouveau01+-3
libdrm_nouveau2               | package | 2.4.43-118.1                    
xorg-x11-driver-video-nouveau | package | 1.0.7&#64;git-2013-04-03
xorg-x11-server               | package | 7.6_1.14.0-243.8         

&#64;Marcin Slusarz, if you are reading this:

Do you think it's worthwhile trying your script limiter patch from <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] nVidia Geforce 7300 fails to properly resume"
   href="show_bug.cgi?id=23223#c18">bug 23223
comment 18</a> mentioned by Ronald in conjunction with
&quot;nouveau.config=DEVINIT=NvForcePost=1&quot;?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1364972543.EA77F63.17665--

--===============1919909452==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1919909452==--
