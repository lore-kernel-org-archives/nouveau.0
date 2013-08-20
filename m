From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66255] Xinerama 2x2 monitor configuration display
	issues
Date: Tue, 20 Aug 2013 01:42:19 +0000
Message-ID: <bug-66255-8800-LJGWK8eIBM@http.bugs.freedesktop.org/>
References: <bug-66255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1531707997=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1531707997==
Content-Type: multipart/alternative; boundary="1376962939.6ECeA2.29914"; charset="us-ascii"


--1376962939.6ECeA2.29914
Date: Tue, 20 Aug 2013 01:42:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66255

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Enabling Xinerama with      |Xinerama 2x2 monitor
                   |nouveau driver causes       |configuration display
                   |Segmentation fault          |issues

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Spaces around operators don't matter in C. You can even do one of my
favourites:

while (x --> 0) { // as x goes to 0
  ...
}

:)

The commit roughly implementing what I was suggesting has been pushed out into
xf86-video-nouveau 1.0.9. But we can repurpose this bug to be about
xinerama-fail. I unfortunately can't really help with that though. I'm also
having a bit of a hard time understanding what you mean when you're describing
those problems, perhaps taking a photo would help. Do note that Xinerama is
considered to be the devil's spawn nowadays, so getting a card with 4 outputs
could be the way to go -- NVE0+ cards can have support for that. If, OTOH,
you're satisified with having 2 separate screens of 2 monitors each (which I
guess is what you were doing at first) and not being able to drag windows
across them, then the multi-screen solution should work too... (just get rid of
zaphod heads/xinerama, but keep the separate device/screen sections pointing at
the right things)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376962939.6ECeA2.29914
Date: Tue, 20 Aug 2013 01:42:19 +0000
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
   title="NEW --- - Xinerama 2x2 monitor configuration display issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Enabling Xinerama with nouveau driver causes Segmentation fault
           </td>
           <td>Xinerama 2x2 monitor configuration display issues
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xinerama 2x2 monitor configuration display issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xinerama 2x2 monitor configuration display issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66255">bug 66255</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Spaces around operators don't matter in C. You can even do one of my
favourites:

while (x --&gt; 0) { // as x goes to 0
  ...
}

:)

The commit roughly implementing what I was suggesting has been pushed out into
xf86-video-nouveau 1.0.9. But we can repurpose this bug to be about
xinerama-fail. I unfortunately can't really help with that though. I'm also
having a bit of a hard time understanding what you mean when you're describing
those problems, perhaps taking a photo would help. Do note that Xinerama is
considered to be the devil's spawn nowadays, so getting a card with 4 outputs
could be the way to go -- NVE0+ cards can have support for that. If, OTOH,
you're satisified with having 2 separate screens of 2 monitors each (which I
guess is what you were doing at first) and not being able to drag windows
across them, then the multi-screen solution should work too... (just get rid of
zaphod heads/xinerama, but keep the separate device/screen sections pointing at
the right things)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376962939.6ECeA2.29914--

--===============1531707997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1531707997==--
