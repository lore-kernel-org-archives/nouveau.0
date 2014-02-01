From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74320] [NV4B] Screen freeze with flashplugin-nonfree
Date: Sat, 01 Feb 2014 14:14:23 +0000
Message-ID: <bug-74320-8800-kSq4bi5nIe@http.bugs.freedesktop.org/>
References: <bug-74320-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0326509181=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74320-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0326509181==
Content-Type: multipart/alternative; boundary="1391264062.aB4bC1.16338"; charset="us-ascii"


--1391264062.aB4bC1.16338
Date: Sat, 1 Feb 2014 14:14:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74320

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Screen freeze with          |[NV4B] Screen freeze with
                   |flashplugin-nonfree         |flashplugin-nonfree

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
If you were to ssh in and kill the offending plugin-container, I bet that'd
work too. A quick fix -- get rid of your libvdpau_nouveau.so. Ugh. I thought
this would only be a problem for nv3x due to lack of NPOT support, so I killed
it off there. But I guess there's some sort of problem with the nv30 driver
handling of vdpau in general. Sigh.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391264062.aB4bC1.16338
Date: Sat, 1 Feb 2014 14:14:22 +0000
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
   title="NEW --- - [NV4B] Screen freeze with flashplugin-nonfree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74320">bug 74320</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Screen freeze with flashplugin-nonfree
           </td>
           <td>[NV4B] Screen freeze with flashplugin-nonfree
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] Screen freeze with flashplugin-nonfree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74320#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV4B] Screen freeze with flashplugin-nonfree"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74320">bug 74320</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>If you were to ssh in and kill the offending plugin-container, I bet that'd
work too. A quick fix -- get rid of your libvdpau_nouveau.so. Ugh. I thought
this would only be a problem for nv3x due to lack of NPOT support, so I killed
it off there. But I guess there's some sort of problem with the nv30 driver
handling of vdpau in general. Sigh.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391264062.aB4bC1.16338--

--===============0326509181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0326509181==--
