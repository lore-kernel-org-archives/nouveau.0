From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78748] [NV11] Nouveau fails initializing KMS on
 Geforce2 Go (NV11M)
Date: Thu, 15 May 2014 17:12:19 +0000
Message-ID: <bug-78748-8800-2ljZ2xqJYk@http.bugs.freedesktop.org/>
References: <bug-78748-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0687436776=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78748-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0687436776==
Content-Type: multipart/alternative; boundary="1400173939.68F0bd2.330"; charset="us-ascii"


--1400173939.68F0bd2.330
Date: Thu, 15 May 2014 17:12:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78748

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
DCB table at 0xd537 version 1.5
DCB 0: type 0 [ANALOG] I2C 0 heads 0 conntag 0 LOCAL OR 0 maxfreq 350000kHz
DCB 1: type 4 [???] I2C 1 heads 1 unk00_4 1 conntag 1 LOCAL OR 1
DCB 2: type 1 [TV] I2C 1 heads 0 unk00_4 1 conntag 2 EXT 0 OR 0

Well that's a little odd... I suspect that throws off some of the logic. Type 4
is "reserved". Yet, somehow it still detects that there's a LVDS...

nvbios doesn't print the other stuff, so it'll take some more decoding to work
out what's what... might look at that later.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1400173939.68F0bd2.330
Date: Thu, 15 May 2014 17:12:19 +0000
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
   title="NEW --- - [NV11] Nouveau fails initializing KMS on Geforce2 Go (NV11M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78748#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV11] Nouveau fails initializing KMS on Geforce2 Go (NV11M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78748">bug 78748</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>DCB table at 0xd537 version 1.5
DCB 0: type 0 [ANALOG] I2C 0 heads 0 conntag 0 LOCAL OR 0 maxfreq 350000kHz
DCB 1: type 4 [???] I2C 1 heads 1 unk00_4 1 conntag 1 LOCAL OR 1
DCB 2: type 1 [TV] I2C 1 heads 0 unk00_4 1 conntag 2 EXT 0 OR 0

Well that's a little odd... I suspect that throws off some of the logic. Type 4
is &quot;reserved&quot;. Yet, somehow it still detects that there's a LVDS...

nvbios doesn't print the other stuff, so it'll take some more decoding to work
out what's what... might look at that later.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1400173939.68F0bd2.330--

--===============0687436776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0687436776==--
