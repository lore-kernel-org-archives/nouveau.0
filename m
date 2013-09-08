From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69083] [NV84] Using 1920x1440 mode on DVI-I -> VGA
 adapter causes output to be compressed into small fraction of top scan
 lines
Date: Sun, 08 Sep 2013 08:23:27 +0000
Message-ID: <bug-69083-8800-7J2pEGRvZD@http.bugs.freedesktop.org/>
References: <bug-69083-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0820143973=="
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


--===============0820143973==
Content-Type: multipart/alternative; boundary="1378628607.F5ac8CA1.6422"; charset="us-ascii"


--1378628607.F5ac8CA1.6422
Date: Sun, 8 Sep 2013 08:23:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69083

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[NV84] using DVI to VGA     |[NV84] Using 1920x1440 mode
                   |adapter for CRT and         |on DVI-I -> VGA adapter
                   |specifying supported        |causes output to be
                   |"PreferredMode" >EDID       |compressed into small
                   |preferred mode, screen      |fraction of top scan lines
                   |output is compressed into   |
                   |small fraction of top scan  |
                   |lines                       |

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so this has nothing to do with setting the PreferredMode. Good, that would
have been weird. Something's not being computed correctly. I wouldn't be
surprised if the mode data in the EDID were somehow wrong for those modes, and
other drivers are just better at dealing with the incorrectness. Or perhaps
we're setting some clock incorrectly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378628607.F5ac8CA1.6422
Date: Sun, 8 Sep 2013 08:23:27 +0000
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
   title="NEW --- - [NV84] Using 1920x1440 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of top scan lines"
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
           <td>[NV84] using DVI to VGA adapter for CRT and specifying supported &quot;PreferredMode&quot; &gt;EDID preferred mode, screen output is compressed into small fraction of top scan lines
           </td>
           <td>[NV84] Using 1920x1440 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of top scan lines
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Using 1920x1440 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Using 1920x1440 mode on DVI-I -&gt; VGA adapter causes output to be compressed into small fraction of top scan lines"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69083">bug 69083</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so this has nothing to do with setting the PreferredMode. Good, that would
have been weird. Something's not being computed correctly. I wouldn't be
surprised if the mode data in the EDID were somehow wrong for those modes, and
other drivers are just better at dealing with the incorrectness. Or perhaps
we're setting some clock incorrectly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378628607.F5ac8CA1.6422--

--===============0820143973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0820143973==--
