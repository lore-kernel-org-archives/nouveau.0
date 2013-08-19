From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62115] Refresh rate stuck at 60Hz
Date: Mon, 19 Aug 2013 22:45:36 +0000
Message-ID: <bug-62115-8800-2TCP0EZ41a@http.bugs.freedesktop.org/>
References: <bug-62115-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1181761700=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62115-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1181761700==
Content-Type: multipart/alternative; boundary="1376952336.DAd02.29961"; charset="us-ascii"


--1376952336.DAd02.29961
Date: Mon, 19 Aug 2013 22:45:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62115

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
[    24.417] (II) NOUVEAU(0): Supported standard timings:
[    24.417] (II) NOUVEAU(0): #0: hsize: 1440  vsize 900  refresh: 60  vid: 149
[    24.417] (II) NOUVEAU(0): #1: hsize: 1440  vsize 900  refresh: 75  vid:
3989
...
[    24.418] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    24.418] (II) NOUVEAU(0): Modeline "1440x900"x59.9  106.50  1440 1520 1672
1904  900 903 909 934 -hsync +vsync (55.9 kHz eP)
[    24.418] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)

Seems like it sees both the 59.9Hz and 75Hz modes just fine.

You should be able to select the right ones by sticking stuff in your xorg.conf
or by doing something like

xrandr --output DVI-I-1 --mode 1440x900 --refresh 75

(or maybe --mode "1440x900"x75)

If you're still having trouble, feel free to re-open and provide the output of
"xrandr -q".

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376952336.DAd02.29961
Date: Mon, 19 Aug 2013 22:45:36 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Refresh rate stuck at 60Hz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62115">bug 62115</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Refresh rate stuck at 60Hz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62115#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Refresh rate stuck at 60Hz"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62115">bug 62115</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>[    24.417] (II) NOUVEAU(0): Supported standard timings:
[    24.417] (II) NOUVEAU(0): #0: hsize: 1440  vsize 900  refresh: 60  vid: 149
[    24.417] (II) NOUVEAU(0): #1: hsize: 1440  vsize 900  refresh: 75  vid:
3989
...
[    24.418] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    24.418] (II) NOUVEAU(0): Modeline &quot;1440x900&quot;x59.9  106.50  1440 1520 1672
1904  900 903 909 934 -hsync +vsync (55.9 kHz eP)
[    24.418] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)

Seems like it sees both the 59.9Hz and 75Hz modes just fine.

You should be able to select the right ones by sticking stuff in your xorg.conf
or by doing something like

xrandr --output DVI-I-1 --mode 1440x900 --refresh 75

(or maybe --mode &quot;1440x900&quot;x75)

If you're still having trouble, feel free to re-open and provide the output of
&quot;xrandr -q&quot;.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376952336.DAd02.29961--

--===============1181761700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1181761700==--
