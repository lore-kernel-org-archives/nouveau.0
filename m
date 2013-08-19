From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62190] [NV43] Invalid ROM contents on PowerMAC G5 11,
 2 with GeForce 6600 LE on PPC64 big endian
Date: Mon, 19 Aug 2013 22:33:02 +0000
Message-ID: <bug-62190-8800-mRh7G5eNeJ@http.bugs.freedesktop.org/>
References: <bug-62190-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0926054064=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62190-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0926054064==
Content-Type: multipart/alternative; boundary="1376951582.dDbEe6b42.27059"; charset="us-ascii"


--1376951582.dDbEe6b42.27059
Date: Mon, 19 Aug 2013 22:33:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62190

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Invalid ROM contents on     |[NV43] Invalid ROM contents
                   |PowerMAC G5 11,2 with       |on PowerMAC G5 11,2 with
                   |GeForce 6600 LE             |GeForce 6600 LE on PPC64
                   |                            |big endian

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think you forgot to describe the issue you're having (beyond "doesn't work").
Is it just the ROM checksum error?

My understanding is that there's also some sort of issue with 64k pages (vs 4k
pages). I don't know much about ppc, so I don't know if it's that's an option
or hardware-dependent. I believe benh was trying to get it all to work, perhaps
he'll have patches when he does.

BTW, are you using this as PPC or PPC64? (Is that even an option with PPC?)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376951582.dDbEe6b42.27059
Date: Mon, 19 Aug 2013 22:33:02 +0000
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
   title="NEW --- - [NV43] Invalid ROM contents on PowerMAC G5 11,2 with GeForce 6600 LE on PPC64 big endian"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62190">bug 62190</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Invalid ROM contents on PowerMAC G5 11,2 with GeForce 6600 LE
           </td>
           <td>[NV43] Invalid ROM contents on PowerMAC G5 11,2 with GeForce 6600 LE on PPC64 big endian
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] Invalid ROM contents on PowerMAC G5 11,2 with GeForce 6600 LE on PPC64 big endian"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62190#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV43] Invalid ROM contents on PowerMAC G5 11,2 with GeForce 6600 LE on PPC64 big endian"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62190">bug 62190</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think you forgot to describe the issue you're having (beyond &quot;doesn't work&quot;).
Is it just the ROM checksum error?

My understanding is that there's also some sort of issue with 64k pages (vs 4k
pages). I don't know much about ppc, so I don't know if it's that's an option
or hardware-dependent. I believe benh was trying to get it all to work, perhaps
he'll have patches when he does.

BTW, are you using this as PPC or PPC64? (Is that even an option with PPC?)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376951582.dDbEe6b42.27059--

--===============0926054064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0926054064==--
