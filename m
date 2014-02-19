From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75203] [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660
 - Strange pink line on left screen side
Date: Wed, 19 Feb 2014 18:22:07 +0000
Message-ID: <bug-75203-8800-keSQVdevZp@http.bugs.freedesktop.org/>
References: <bug-75203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1779294654=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75203-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1779294654==
Content-Type: multipart/alternative; boundary="1392834127.f00262.22213"; charset="us-ascii"


--1392834127.f00262.22213
Date: Wed, 19 Feb 2014 18:22:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75203

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Asus Maximus IV GENE-Z -    |[NVE6] Asus Maximus IV
                   |Nvidia GTX660 - Strange     |GENE-Z - Nvidia GTX660 -
                   |pink line on left screen    |Strange pink line on left
                   |side                        |screen side

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I wonder if playing with xrandr settings will make the line go away.

Take a look at "xrandr --props". Things like "scaling mode" and the various
"underscan" stuff.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392834127.f00262.22213
Date: Wed, 19 Feb 2014 18:22:07 +0000
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
   title="NEW --- - [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75203">bug 75203</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side
           </td>
           <td>[NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75203#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6] Asus Maximus IV GENE-Z - Nvidia GTX660 - Strange pink line on left screen side"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75203">bug 75203</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I wonder if playing with xrandr settings will make the line go away.

Take a look at &quot;xrandr --props&quot;. Things like &quot;scaling mode&quot; and the various
&quot;underscan&quot; stuff.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392834127.f00262.22213--

--===============1779294654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1779294654==--
