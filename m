From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67628] [NVC1] [BISECTED] Monitor on Display port
 shows distortions
Date: Thu, 13 Feb 2014 22:19:35 +0000
Message-ID: <bug-67628-8800-BAtX83nvuf@http.bugs.freedesktop.org/>
References: <bug-67628-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0122573966=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67628-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0122573966==
Content-Type: multipart/alternative; boundary="1392329975.DdFC72.27539"; charset="us-ascii"


--1392329975.DdFC72.27539
Date: Thu, 13 Feb 2014 22:19:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67628

--- Comment #24 from Michael Gulick <mgulick-I5WecO5yM8GakBO8gow8eQ@public.gmane.org> ---
It looks like that function is in
drivers/gpu/drm/nouveau/core/engine/disp/dport.c, but I can't figure out how it
should be modified to set the lane count.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392329975.DdFC72.27539
Date: Thu, 13 Feb 2014 22:19:35 +0000
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
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [BISECTED] Monitor on Display port shows distortions"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67628">bug 67628</a>
              from <span class="vcard"><a class="email" href="mailto:mgulick&#64;mathworks.com" title="Michael Gulick &lt;mgulick&#64;mathworks.com&gt;"> <span class="fn">Michael Gulick</span></a>
</span></b>
        <pre>It looks like that function is in
drivers/gpu/drm/nouveau/core/engine/disp/dport.c, but I can't figure out how it
should be modified to set the lane count.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392329975.DdFC72.27539--

--===============0122573966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0122573966==--
