From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72207] [NV67] Error retrieving EDID from VGA
Date: Wed, 05 Feb 2014 16:55:20 +0000
Message-ID: <bug-72207-8800-6eeknswdiX@http.bugs.freedesktop.org/>
References: <bug-72207-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0929838321=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72207-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0929838321==
Content-Type: multipart/alternative; boundary="1391619320.4DfE71.31657"; charset="us-ascii"


--1391619320.4DfE71.31657
Date: Wed, 5 Feb 2014 16:55:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72207

--- Comment #2 from Priit Laes (irc: plaes) <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> ---
(In reply to comment #1)
> I assume there's a monitor actually connected (that supports EDID)? Did this
> work with older kernels (if so which)?
> 
> Please upload a copy of your VBIOS (/sys/kernel/debug/dri/0/vbios.rom)

OK, had finally change to test this display (Samsung SyncMaster 2043NW) with
another machine (Lenovo X60s laptop) which had the same issue:

[83002.030045] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 130
[83002.030054] Raw EDID:
[83002.030060]      00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[83002.030063]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030067]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030070]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030073]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030076]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030080]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030083]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049040] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 130
[83002.049050] Raw EDID:
[83002.049056]      00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[83002.049059]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049063]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049066]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049069]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049073]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049076]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049079]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068039] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 130
[83002.068048] Raw EDID:
[83002.068053]      00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[83002.068057]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068061]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068064]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068067]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068070]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068073]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068077]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087039] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 130
[83002.087048] Raw EDID:
[83002.087054]      00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[83002.087058]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087061]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087065]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087068]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087071]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087074]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087077]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087087] i915 0000:00:02.0: VGA-1: EDID block 0 invalid.


It is fairly old machine and before I installed Fedora on that it was
virus-infested Windows XP which apparently supplies better default EDID data in
case something goes wrong...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391619320.4DfE71.31657
Date: Wed, 5 Feb 2014 16:55:20 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV67] Error retrieving EDID from VGA"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72207#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV67] Error retrieving EDID from VGA"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72207">bug 72207</a>
              from <span class="vcard"><a class="email" href="mailto:plaes&#64;plaes.org" title="Priit Laes (irc: plaes) &lt;plaes&#64;plaes.org&gt;"> <span class="fn">Priit Laes (irc: plaes)</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=72207#c1">comment #1</a>)
<span class="quote">&gt; I assume there's a monitor actually connected (that supports EDID)? Did this
&gt; work with older kernels (if so which)?
&gt; 
&gt; Please upload a copy of your VBIOS (/sys/kernel/debug/dri/0/vbios.rom)</span >

OK, had finally change to test this display (Samsung SyncMaster 2043NW) with
another machine (Lenovo X60s laptop) which had the same issue:

[83002.030045] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 130
[83002.030054] Raw EDID:
[83002.030060]      00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[83002.030063]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030067]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030070]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030073]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030076]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030080]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.030083]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049040] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 130
[83002.049050] Raw EDID:
[83002.049056]      00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[83002.049059]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049063]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049066]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049069]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049073]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049076]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.049079]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068039] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 130
[83002.068048] Raw EDID:
[83002.068053]      00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[83002.068057]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068061]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068064]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068067]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068070]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068073]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.068077]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087039] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 130
[83002.087048] Raw EDID:
[83002.087054]      00 ff ff ff ff ff ff 00 ff ff ff ff ff ff ff ff
[83002.087058]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087061]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087065]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087068]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087071]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087074]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087077]      ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[83002.087087] i915 0000:00:02.0: VGA-1: EDID block 0 invalid.


It is fairly old machine and before I installed Fedora on that it was
virus-infested Windows XP which apparently supplies better default EDID data in
case something goes wrong...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391619320.4DfE71.31657--

--===============0929838321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0929838321==--
