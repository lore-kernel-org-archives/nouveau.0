From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43939] [NV96] monitor connected via HDMI->DVI
 adapter is blank / standby (9500GS)
Date: Sun, 25 Aug 2013 05:49:21 +0000
Message-ID: <bug-43939-8800-he2PevhWcd@http.bugs.freedesktop.org/>
References: <bug-43939-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0010942299=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-43939-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0010942299==
Content-Type: multipart/alternative; boundary="1377409761.5EE43.9835"; charset="us-ascii"


--1377409761.5EE43.9835
Date: Sun, 25 Aug 2013 05:49:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=43939

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[NV96] DVI monitor          |[NV96] monitor connected
                   |connected via HDMI is blank |via HDMI->DVI adapter is
                   |/ standby (NV96 / 9500GS)   |blank / standby (9500GS)

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Oh, I'm in no way trying to lay the blame away from nouveau :) Just getting the
facts straight. I assume this is just an adapter (i.e. round hole/square peg),
not a converter. In this case, the card would actually drive the port as a DVI
port that just happens to be using a HDMI cable. Which actually makes the
problem more likely to be unrelated to the one in the other bug.

For completeness, could you upload your vbios
(/sys/kernel/debug/dri/0/vbios.rom)?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377409761.5EE43.9835
Date: Sun, 25 Aug 2013 05:49:21 +0000
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
   title="NEW --- - [NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>[NV96] DVI monitor connected via HDMI is blank / standby (NV96 / 9500GS)
           </td>
           <td>[NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96] monitor connected via HDMI-&gt;DVI adapter is blank / standby (9500GS)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=43939">bug 43939</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Oh, I'm in no way trying to lay the blame away from nouveau :) Just getting the
facts straight. I assume this is just an adapter (i.e. round hole/square peg),
not a converter. In this case, the card would actually drive the port as a DVI
port that just happens to be using a HDMI cable. Which actually makes the
problem more likely to be unrelated to the one in the other bug.

For completeness, could you upload your vbios
(/sys/kernel/debug/dri/0/vbios.rom)?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377409761.5EE43.9835--

--===============0010942299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0010942299==--
