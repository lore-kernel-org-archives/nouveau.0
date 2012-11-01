From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 56347] NVPlatformProbe routine does not mark the
 entity as Shared for ZaphodHeads.
Date: Thu, 01 Nov 2012 03:30:43 +0000
Message-ID: <bug-56347-8800-XS9wYewMtx@http.bugs.freedesktop.org/>
References: <bug-56347-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0353347798=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-56347-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0353347798==
Content-Type: multipart/alternative; boundary="1351740643.Ff8bECA62.28039"; charset="us-ascii"


--1351740643.Ff8bECA62.28039
Date: Thu, 1 Nov 2012 03:30:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=56347

Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Version|unspecified                 |git

--- Comment #2 from Damian Nowak <nowaker-qMBiBlq7xnnVItvQsEIGlw@public.gmane.org> ---
I tried calling xf86SetEntityShared(0) in nv_driver.c before xf86AllocateScreen
and xf86AddEntityToScreen are called. Unfortunately, it isn't enough.

It would be great if any hacker could take a look at it. ZaphodHeads is the
only way of dealing with multiple GPUs and monitors on Nouveau.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351740643.Ff8bECA62.28039
Date: Thu, 1 Nov 2012 03:30:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:nowaker&#64;geozone.pl" title="Damian Nowak &lt;nowaker&#64;geozone.pl&gt;"> <span class="fn">Damian Nowak</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347">bug 56347</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Version</td>
           <td>unspecified
           </td>
           <td>git
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - NVPlatformProbe routine does not mark the entity as Shared for ZaphodHeads."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=56347">bug 56347</a>
              from <span class="vcard"><a class="email" href="mailto:nowaker&#64;geozone.pl" title="Damian Nowak &lt;nowaker&#64;geozone.pl&gt;"> <span class="fn">Damian Nowak</span></a>
</span></b>
        <pre>I tried calling xf86SetEntityShared(0) in nv_driver.c before xf86AllocateScreen
and xf86AddEntityToScreen are called. Unfortunately, it isn't enough.

It would be great if any hacker could take a look at it. ZaphodHeads is the
only way of dealing with multiple GPUs and monitors on Nouveau.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351740643.Ff8bECA62.28039--

--===============0353347798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0353347798==--
