-- ============================================================================
-- AUTOBURST CORE ENGINE CONFIGURATION (v2.2+)
-- Loaded by autoburst.lua via require('AutoBurst_config') -- this file has
-- no effect on its own. See CHANGES.md for what's changed and why.
-- ============================================================================

-- Toggle verbose debugging outputs in the Ashita console (true / false)
DebugMode = false

-- List of Main Jobs that are permitted to auto-burst. 
-- If your current main job isn't here, the addon safely sleeps.
BurstJobs = { 'BLM', 'RDM', 'SCH', 'GEO', 'DRK' }

-- Maximum spell tier index allowed per job.
-- Enforces a hard ceiling on standard elemental nukes to prevent the client
-- from attempting spells your current job tier doesn't actually have.
MaxTierByJob = {
    ['BLM'] = 'VI',
    ['RDM'] = 'V',
    ['SCH'] = 'V',
    ['GEO'] = 'V',
    ['DRK'] = 'II',
}

-- ============================================================================
-- BURST MAGIC CONFIGURATION
-- ============================================================================
-- Map the base spell or element name to use under each skillchain property.
-- To completely disable a skillchain window, enter "void".
--
-- Supported Spell Types:
-- 1. Traditional Elemental: Enter the raw element (e.g., "Fire", "Thunder").
--    The script will dynamically append Roman numerals based on your TierOrder.
--
-- 2. Dark Magic Tiers: Enter "Aspir", "Drain", or "Bio". 
--    The script will map them safely up to tier III (e.g., "Aspir III", "Aspir II").
--
-- 3. Heavy Single-Tier Spells: Enter "Death", "Kaustra", or "Impact".
--    The script will automatically execute them ONLY when your TierOrder hits "I", 
--    safely skipping and ignoring all higher tiers (VI through II) without crashing.
BurstMagic = {
    -- LEVEL 3 and 4 (Light/Dark Endgame Windows)
    ["Radiance"]      = "Thunder",
    ["Light"]         = "Stun",
    ["Umbra"]         = "Death",       
    ["Darkness"]      = "Impact",   
    -- LEVEL 2
    ["Gravitation"]   = "Blizzard",
    ["Fragmentation"] = "Thunder",
    ["Distortion"]    = "Blizzard",
    ["Fusion"]        = "Thunder",
    -- LEVEL 1
    ["Compression"]   = "Blizzard",       
    ["Liquefaction"]  = "Thunder",
    ["Induration"]    = "Blizzard",
    ["Reverberation"] = "Water",
    ["Transfixion"]   = "Banish",
    ["Scission"]      = "Stone",
    ["Detonation"]    = "Aero",
    ["Impaction"]     = "Thunder",
}

-- HELIX SPELL NAMES (Scholar)
-- Maps elements to their specific Helix dictionary entries. 
-- Do not alter these base assignments.
HelixMagic = {
    ["Stone"]    = "Geohelix",
    ["Water"]    = "Hydrohelix",
    ["Aero"]     = "Anemohelix",
    ["Fire"]     = "Pyrohelix",
    ["Blizzard"] = "Cryohelix",
    ["Thunder"]  = "Ionohelix",
    ["Banish"]   = "Luminohelix",
    ["Aspir"]    = "Noctohelix",
}

-- ============================================================================
-- SPELL TIER ORDER & PRIORITY
-- ============================================================================
-- Arranged from highest priority [1] to lowest priority [8].
-- Will cast continuously while window is open to attempt multiple bursts based on timing configuration settings below
-- NOTE FOR SINGLE-TIER SPELLS (Death, Kaustra, Impact): These spells are hard-mapped
-- to tier "I". They will be checked and executed when the loop reaches priority [3] below.
TierOrder = {
    [1] = "Impact",
    [2] = "I",
    [3] = "II",
    [4] = "III",
    [5] = "IV",         
    [6] = "V",        
    [7] = "VI",
    [8] = "Helix II"
}

-- ============================================================================
-- TIMING AND BUFFER TUNING
-- ============================================================================
-- How many burst spells to attempt in a row within a single skillchain window.
MaxBurstsPerChain = 1

-- Base seconds to wait between each chained burst attempt.
-- Keep this at a minimum of 3, as the script will now automatically inject an extra 
-- 2.5-second buffer if a slow Dark Magic or Helix spell is detected.
BurstChainDelay = 3

-- Extra delay buffer (in seconds) added to the target lock acquisition 
-- sequence before casting begins. Set to 0 default; increase if targeting macros hang.
ExtendedDelay = 0

-- ============================================================================
-- EMERGENCY ASPIR / RECOVERY CONFIGURATION
-- ============================================================================
-- If true, the script will completely replace an elemental magic burst with an
-- emergency Aspir cycle if your MP drops below the specified threshold.
Aspir_NoBurst = false
Aspir_MPAmount = 300

-- ============================================================================
-- STATUS MAINTENANCE & REMEDIAL ITEMS
-- ============================================================================
-- Automatically use inventory items to strip Silence when detected.
AttemptSilenceRemoval = false

UseEchoDrops      = true   -- Item ID: 4151
UseRemedy         = false  -- Item ID: 4155
UseCatholicon     = false  -- Item ID: 4206
UseVicarsDrink    = false  -- Item ID: 5439
UseRemedyOintment = false  -- Item ID: 5326