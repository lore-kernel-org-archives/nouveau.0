From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69083] [NV84] using DVI to VGA adapter for CRT and
 specifying supported "PreferredMode" >EDID preferred mode,
 screen output is compressed into small fraction of top scan lines
Date: Sun, 08 Sep 2013 04:18:50 +0000
Message-ID: <bug-69083-8800-OEhXuttuyd@http.bugs.freedesktop.org/>
References: <bug-69083-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0399516661=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69083-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0399516661==
Content-Type: multipart/alternative; boundary="1378613930.CBFBc4DF1.9683"; charset="us-ascii"


--1378613930.CBFBc4DF1.9683
Date: Sun, 8 Sep 2013 04:18:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69083

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|using DVI to VGA adapter    |[NV84] using DVI to VGA
                   |for CRT and specifying      |adapter for CRT and
                   |supported "PreferredMode"   |specifying supported
                   |>EDID preferred mode,       |"PreferredMode" >EDID
                   |screen output is compressed |preferred mode, screen
                   |into small fraction of top  |output is compressed into
                   |scan lines                  |small fraction of top scan
                   |                            |lines

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Are you sure that the display is actually compressed into the top few
scanlines? e.g. do you see the mouse cursor in there when you move it around?
Does it show your normal background? Or is it just garbage that happens to not
have 0's for the top few scanlines' worth of data?

I've never used PreferredMode before. If you remove it, I assume everything
works fine? What happens if you run something like

xrandr --output DVI-I-1 --mode 1920x1440

does that fix things for you? Can you supply the output of

xrandr --verbose

after X has started? (You can e.g. ssh in and run DISPLAY=:0 xrandr --verbose)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378613930.CBFBc4DF1.9683
Date: Sun, 8 Sep 2013 04:18:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines
           </td>
           <td>[NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Are you sure that the display is actually compressed into the top few
scanlines? e.g. do you see the mouse cursor in there when you move it around?
Does it show your normal background? Or is it just garbage that happens to not
have 0's for the top few scanlines' worth of data?

I've never used PreferredMode before. If you remove it, I assume everything
works fine? What happens if you run something like

xrandr --output DVI-I-1 --mode 1920x1440

does that fix things for you? Can you supply the output of

xrandr --verbose

after X has started? (You can e.g. ssh in and run DISPLAY=:0 xrandr --verbose)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378613930.CBFBc4DF1.9683--

--===============0399516661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0399516661==--
