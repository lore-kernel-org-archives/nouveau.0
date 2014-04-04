From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77045] [NVC1] HDMI-Monitor toogles between on/off
Date: Fri, 04 Apr 2014 13:59:55 +0000
Message-ID: <bug-77045-8800-yhSgGiOqgS@http.bugs.freedesktop.org/>
References: <bug-77045-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2021235144=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77045-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2021235144==
Content-Type: multipart/alternative; boundary="1396619995.6f41e4Ff2.6608"; charset="us-ascii"


--1396619995.6f41e4Ff2.6608
Date: Fri, 4 Apr 2014 13:59:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77045

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|HDMI-Monitor toogles        |[NVC1] HDMI-Monitor toogles
                   |between on/off              |between on/off

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The fact that it works with the blob rules out a hardware issue in the
converter.

I've never heard of anything like this... mind booting with

nouveau.debug=PDISP=debug,VBIOS=trace drm.debug=0xe

and waiting for the issue to occur, and grabbing dmesg after that? That should
give us an idea of who is turning the monitor off.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396619995.6f41e4Ff2.6608
Date: Fri, 4 Apr 2014 13:59:55 +0000
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
   title="NEW --- - [NVC1] HDMI-Monitor toogles between on/off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77045">bug 77045</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>HDMI-Monitor toogles between on/off
           </td>
           <td>[NVC1] HDMI-Monitor toogles between on/off
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] HDMI-Monitor toogles between on/off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77045#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] HDMI-Monitor toogles between on/off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77045">bug 77045</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The fact that it works with the blob rules out a hardware issue in the
converter.

I've never heard of anything like this... mind booting with

nouveau.debug=PDISP=debug,VBIOS=trace drm.debug=0xe

and waiting for the issue to occur, and grabbing dmesg after that? That should
give us an idea of who is turning the monitor off.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396619995.6f41e4Ff2.6608--

--===============2021235144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2021235144==--
