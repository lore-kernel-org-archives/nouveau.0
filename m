From: Eric Valette <Eric.Valette@Free.fr>
Subject: When will nouveau kernel tree be merged into master
Date: Thu, 09 Jul 2009 14:00:29 +0200
Message-ID: <4A55DBDD.6030703@Free.fr>
Reply-To: Eric.Valette@Free.fr
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=dri-devel>
List-Post: <mailto:dri-devel@lists.sourceforge.net>
List-Help: <mailto:dri-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.sourceforge.net?subject=subscribe>
Errors-To: dri-devel-bounces@lists.sourceforge.net
To: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.sourceforge.net
List-Id: nouveau.vger.kernel.org

Hi,

I've been using nouveau driveau for 8 months or so, using automated
build from drm git, xf86-video-nouveau git and even sometimes mesa drm
git  and discovered the linux-core build did not build the nouveau
driver the hard way: X was refusing to start as the nouveau.ko modules
was not loaded nor build. Build process did chnage without obvious way
to know womething was wrong.

Then I tried to build it by hand as the nouveau directory is still there
but compilation fails! I wonder why the code is still in the tree as it
make me waste quite some time trying to find where the missing
definitions had gone.

After some hours of goggling I discovered there was an git kernel tree
for nouveau. Got the feeling from dri-devel posts it was supposed to be
merged for rc1, checked master tree and found it was not merged.

So my question are:
    - Why not purely delete nouveau files from linux-core and issue
error messages?
    - When will nouveau in kernel git tree be merged? I know the merge
windows is closed but that usually does not hold for new drivers

Thanks. Using nouveau is quite painfull. Please be aware that as
distribution move too slowly into nominal nouveau driver support, I'm
not probably the only guy lost in the dust.

-- eric


------------------------------------------------------------------------------
Enter the BlackBerry Developer Challenge  
This is your chance to win up to $100,000 in prizes! For a limited time, 
vendors submitting new applications to BlackBerry App World(TM) will have
the opportunity to enter the BlackBerry Developer Challenge. See full prize  
details at: http://p.sf.net/sfu/Challenge
--
